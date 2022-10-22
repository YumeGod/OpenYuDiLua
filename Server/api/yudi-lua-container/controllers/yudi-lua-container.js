const { parseMultipartData, sanitizeEntity } = require('strapi-utils');

module.exports = {
  /**
   * Create a record.
   *
   * @return {Object}
   */

  async create(ctx) {
    let entity;
    if (ctx.is('multipart')) {
      const { data, files } = parseMultipartData(ctx);
      data.authorID = ctx.state.user.username;
      entity = await strapi.services["yudi-lua-container"].create(data, { files });
    } else {
      ctx.request.body.authorID = ctx.state.user.username;
      entity = await strapi.services["yudi-lua-container"].create(ctx.request.body);
    }
    return sanitizeEntity(entity, { model: strapi.models["yudi-lua-container"] });
  },

  /**
   * Update a record.
   *
   * @return {Object}
   */

  async update(ctx) {
    const { id } = ctx.params;

    let entity;

    const [yudiluacontainer] = await strapi.services["yudi-lua-container"].find({
      id: ctx.params.id,
      'authorID': ctx.state.user.username,
    });

    if (!yudiluacontainer) {
      return ctx.unauthorized(`You can't update this entry`);
    }

    if (ctx.is('multipart')) {
      const { data, files } = parseMultipartData(ctx);
      entity = await strapi.services["yudi-lua-container"].update({ id }, data, {
        files,
      });
    } else {
      entity = await strapi.services["yudi-lua-container"].update({ id }, ctx.request.body);
    }

    return sanitizeEntity(entity, { model: strapi.models["yudi-lua-container"] });
  },
};