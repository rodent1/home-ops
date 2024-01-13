// Note: Cross-Seed vars should be escaped with $${VAR_NAME} to avoid interpolation by Flux
module.exports = {
    delay: 20,
    qbittorrentUrl: "http://qbittorrent.media.svc.cluster.local",
    torznab: [
      `http://prowlarr.media.svc.cluster.local/35/api?apikey=$${process.env.PROWLARR_API_KEY}`, // tl
      `http://prowlarr.media.svc.cluster.local/1/api?apikey=$${process.env.PROWLARR_API_KEY}`, // hdb
    ],
    port: process.env.CROSSSEED_PORT || 80,
    apiAuth: false,
    action: "inject",
    includeEpisodes: false,
    includeSingleEpisodes: true,
    includeNonVideos: true,
    duplicateCategories: true,
    matchMode: "safe",
    skipRecheck: true,
    linkType: "hardlink",
    linkDir: "/media/Downloads/complete/cross-seed",
    dataDirs: [
      "/media/Downloads/complete/prowlarr",
      "/media/Downloads/complete/radarr",
      "/media/Downloads/complete/tv-sonarr",
    ],
    maxDataDepth: 1,
    outputDir: "/config/xseeds",
    torrentDir: "/config/qBittorrent/BT_backup",
  };
