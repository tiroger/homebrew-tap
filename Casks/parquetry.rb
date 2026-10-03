# Homebrew cask for Parquetry: template rendered by scripts/update-cask.sh into
# Casks/parquetry.rb of the tiroger/homebrew-tap repository.
#   brew install --cask tiroger/tap/parquetry
cask "parquetry" do
  version "0.4.0"
  sha256 "67b49d681a209aef4353c3e96a76849e9079c6c192aa7765ad56c99d72e52ebc"

  url "https://github.com/tiroger/parquetry/releases/download/v#{version}/Parquetry-#{version}.zip"
  name "Parquetry"
  desc "Fast viewer for Parquet, Arrow, CSV and JSON files, local or on S3"
  homepage "https://github.com/tiroger/parquetry"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true # Sparkle
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
