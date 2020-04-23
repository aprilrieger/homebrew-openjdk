# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk8-openj9-jre-large' do
  version '8,252:b09.1'
  sha256 '625edb162d3c074500269af6f26e97fd94c9a383b1d264c917fb410392841e4f'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u252-b09.1_openj9-0.20.0/OpenJDK8U-jre_x64_mac_openj9_macosXL_8u252b09_openj9-0.20.0.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name 'AdoptOpenJDK 8 (OpenJ9) (JRE) (XL)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jre_x64_mac_openj9_macosXL_8u252b09_openj9-0.20.0.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.8-openj9.jre'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.8-openj9.jre'
end
