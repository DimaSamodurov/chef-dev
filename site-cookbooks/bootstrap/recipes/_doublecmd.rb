apt_repository 'doublecmd-qt' do
  uri 'http://download.opensuse.org/repositories/home:/Alexx2000/xUbuntu_14.04'
  distribution '/'
end

package 'doublecmd-qt' do
  options '--force-yes'
end
