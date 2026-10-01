# Homebrew cask for Parquetry: template rendered by scripts/update-cask.sh into
# Casks/parquetry.rb of the tiroger/homebrew-tap repository.
#   brew install --cask tiroger/tap/parquetry
cask "parquetry" do
  version "0.3.0"
  sha256 "a49b1f842d5b866c444bf0e5856a42024d120af511bd07cfbdafb24abf025e06"

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
