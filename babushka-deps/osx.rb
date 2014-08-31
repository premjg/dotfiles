dep 'osx' do
  requires 'homebrew.pkg'
  requires 'brew cask'

  requires 'virtualbox'
  requires 'boot2docker'
  requires 'vagrant'
end

dep 'homebrew.pkg'
dep 'virtualbox.bin'

dep 'brew cask' do
  met? do
    shell? "brew list brew-cask"
  end

  meet do
    shell 'brew tap phinze/homebrew-cask && brew install brew-cask'
  end
end

dep 'boot2docker' do
  met? do
    shell? "brew list boot2docker"
  end

  meet do
    shell "brew install boot2docker"
  end
end

dep 'virtualbox' do
  met? do
    shell? "brew cask list virtualbox"
  end

  meet do
    shell "brew cask install virtualbox"
  end
end

dep 'vagrant' do
  met? do
    shell? "vagrant -v"
  end

  meet do
    shell "brew cask install vagrant"
  end
end
