unless File.exists?("/Applications/iStat Menus.app")
TMP_FILE="/tmp/istatmenus3.zip"

  remote_file TMP_FILE do
    source node["istatmenus3_download_uri"]
    mode "0644"
    owner WS_USER
  end

  execute "Unzip iStat Menus" do
    command "unzip #{TMP_FILE}"
    user WS_USER
  end

  execute "Move iStat Menus to /Applications" do
    command "mv /tmp/iStat\\ Menus.app /Applications"
    user WS_USER
  end
#  execute "copy skype to /Applications" do
#    command "cp -rf /Volumes/Skype/Skype.app /Applications/"
#    user WS_USER
#  end
#
#  execute "unmount dmg" do
#    command "hdiutil detach /Volumes/Skype"
#    user WS_USER
#  end
#
#  ruby_block "test to see if Skype was installed" do
#    block do
#      raise "Skype install failed" unless File.exists?("/Applications/Skype.app")
#    end
#  end
end
