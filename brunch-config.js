exports.config = {
  files: {
    javascripts: {
      joinTo: "js/app.js",
      order: {
        before: [
          "web/static/vendor/js/jquery.min.js",
          "web/static/vendor/js/angular.min.js",
          "web/static/vendor/js/toastr.min.js"
        ]
      }
    },
    stylesheets: {
      joinTo: "css/app.css"
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    assets: /^(web\/static\/assets)/
  },

  paths: {
    watched: [
      "web/static",
      "test/static"
    ],

    public: "priv/static"
  },

  plugins: {
    babel: {
      ignore: [/web\/static\/vendor/]
    }
  },

  modules: {
    wrapper: false
  },

  npm: {
    enabled: true,
    whitelist: ["phoenix", "phoenix_html"]
  }
};
