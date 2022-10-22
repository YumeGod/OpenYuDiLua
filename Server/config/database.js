module.exports = ({ env }) => ({
  defaultConnection: 'default',
  connections: {
    default: {
      connector: 'bookshelf',
      settings: {
        client: 'sqlite',
        filename: env('DATABASE_FILENAME', '.tmp/data.db'),
        timezone: "Asia/Shanghai",
      },
      options: {
        useNullAsDefault: true,
      },
    },
  },
});
