module.exports = {
  transpileDependencies: ["vuetify"],
  pluginOptions: {
    electronBuilder: {
      nodeIntegration: true,
      builderOptions: {
        appId: "com.pluto4planet.mmmm",
        productName: "Michael's Minecraft Modpack Manager",
        win: {
          //icon: "./public/logo.png",
          target: [
            {
              target: "nsis",
              arch: ["x64"]
            }
          ]
        },
        nsis:{
          oneClick: false,
          allowToChangeInstallationDirectory: true
        },
        publish: [
          {
            "provider": "github"
          }
        ]
      }
    }
  },
};
