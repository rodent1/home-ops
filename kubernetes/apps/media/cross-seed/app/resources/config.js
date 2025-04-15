// Torrent content layout: Original
// Default Torrent Management Mode: Automatic
// Default Save Path: /media/Downloads/complete
// Incomplete Save Path: /media/Downloads/incomplete

module.exports = {
  action: "inject",
  apiKey: process.env.CROSS_SEED_API_KEY,
  delay: 30,
  includeNonVideos: true,
  includeSingleEpisodes: true,
  linkCategory: "cross-seed",
  linkDirs: ["/media/Downloads/complete/cross-seed"],
  linkType: "hardlink",
  matchMode: "partial",
  outputDir: null,
  port: Number(process.env.CROSS_SEED_PORT),
  qbittorrentUrl: "http://qbittorrent.media.svc.cluster.local",
  skipRecheck: true,
  torznab: [], // Only using announcements from autobrr
  useClientTorrents: true,
};
