Gem::Specification.new do |s|
  s.name              = 'integrity-email'
  s.version           = '1.0.0'
  s.date              = '2008-11-16'
  s.summary           = 'Campfire notifier for the Integrity continuous integration server'
  s.description       = 'Easily let Integrity alert Campfire after each build'
  s.homepage          = 'http://integrityapp.com'
  s.email             = 'chris@ozmm.org'
  s.authors           = ['Chris Wanstrath']
  s.has_rdoc          = false
  s.files             = %w( README.markdown lib/notifier/config.haml lib/notifier/campfire.rb )

  s.add_dependency 'foca-integrity'
  s.add_dependency 'tinder'
end
