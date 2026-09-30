# Homebrew cask for Parquetry: template rendered by scripts/update-cask.sh into
# Casks/parquetry.rb of the tiroger/homebrew-tap repository.
#   brew install --cask tiroger/tap/parquetry
cask "parquetry" do
  version "0.1.0"
  sha256 "a6d3549200f35d99b0503280bf86ac0ddaaca36ce78c00aaf1de3bfb1c61140e"

  url "https://github.com/tiroger/parquetry/releases/download/v#{version}/Parquetry-#{version}.zip"
  name "Parquetry"
  desc "Fast viewer for Parquet, Arrow, CSV and JSON files, local or on S3"
  homepage "https://github.com/tiroger/parquetry"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true # Sparkle
  depends_on arch: :arm64 # Apple Silicon builds only, for now
  depends_on macos: :ventura # macOS 13 or newer

  app "Parquetry.app"
  binary "#{appdir}/Parquetry.app/Contents/Resources/bin/parquetry"

  zap trash: [
    "~/Library/Application Support/Parquetry",
    "~/Library/Caches/Parquetry",
    "~/Library/Caches/io.parquetry.app",
    "~/Library/HTTPStorages/io.parquetry.app",
    "~/Library/Preferences/io.parquetry.app.plist",
    "~/Library/Saved Application State/io.parquetry.app.savedState",
  ]
end
