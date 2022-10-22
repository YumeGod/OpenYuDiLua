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
      entity = await strapi.services.config.create(data, { files });
    } else {
      ctx.request.body.authorID = ctx.state.user.username;
      entity = await strapi.services.config.create(ctx.request.body);
    }
    return sanitizeEntity(entity, { model: strapi.models.config });
  },

  /**
   * Update a record.
   *
   * @return {Object}
   */

  async update(ctx) {
    const { id } = ctx.params;

    let entity;

    const [config] = await strapi.services.config.find({
      id: ctx.params.id,
      'authorID': ctx.state.user.username,
    });

    if (!config) {
      return ctx.unauthorized(`You can't update this entry`);
    }

    if (ctx.is('multipart')) {
      const { data, files } = parseMultipartData(ctx);
      entity = await strapi.services.config.update({ id }, data, {
        files,
      });
    } else {
      entity = await strapi.services.config.update({ id }, ctx.request.body);
    }

    return sanitizeEntity(entity, { model: strapi.models.config });
  },
};