cask 'docker-edge' do
  version '2.3.0.1,44875'
  sha256 '484290de6e38ffb1db4da8cd9f1ef58fd1cbe96fd0bc0d5bf56dc196012070cf'

  url "https://download.docker.com/mac/edge/#{version.after_comma}/Docker.dmg"
  appcast 'https://download.docker.com/mac/edge/appcast.xml'
  name 'Docker Community Edition for Mac (Edge)'
  name 'Docker CE for Mac (Edge)'
  homepage 'https://www.docker.com/products/docker-desktop'

  auto_updates true
  depends_on macos: '>= :yosemite'

  app 'Docker.app'

  uninstall delete:    [
                         '/Library/PrivilegedHelperTools/com.docker.vmnetd',
                         '/private/var/tmp/com.docker.vmnetd.socket',
                         '/usr/local/bin/docker',
                         '/usr/local/bin/docker-compose',
                         '/usr/local/bin/docker-credential-desktop',
                         '/usr/local/bin/docker-credential-osxkeychain',
                         '/usr/local/bin/hyperkit',
                         '/usr/local/bin/kubectl',
                         '/usr/local/bin/kubectl.docker',
                         '/usr/local/bin/notary',
                         '/usr/local/bin/vpnkit',
                       ],
            launchctl: [
                         'com.docker.helper',
                         'com.docker.vmnetd',
                       ],
            quit:      'com.docker.docker'

  zap trash: [
               '/usr/local/bin/docker-compose.backup',
               '/usr/local/bin/docker.backup',
               '~/Library/Application Scripts/com.docker.helper',
               '~/Library/Caches/KSCrashReports/Docker',
               '~/Library/Caches/com.docker.docker',
               '~/Library/Caches/com.plausiblelabs.crashreporter.data/com.docker.docker',
               '~/Library/Containers/com.docker.docker',
               '~/Library/Containers/com.docker.helper',
               '~/Library/Group Containers/group.com.docker',
               '~/Library/Preferences/com.docker.docker.plist',
             ],
      rmdir: [
               '~/Library/Caches/KSCrashReports',
               '~/Library/Caches/com.plausiblelabs.crashreporter.data',
             ]
end
