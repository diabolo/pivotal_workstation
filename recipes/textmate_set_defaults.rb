execute "set save on losing focus" do
  command "defaults write ~/Library/Preferences/com.macromates.textmate OakSaveAllOnDeactivate -bool TRUE"
  user WS_USER
end

execute "show line numbers" do
  command "defaults write ~/Library/Preferences/com.macromates.textmate OakTextViewLineNumbersEnabled -bool TRUE"
  user WS_USER
end

ruby_block "soft tabs & tabs stop of 2" do
  block do
    require 'rubygems'
    require 'plist'
    require 'time'
    # FIXME:  if plist  doesn't exist, create it.
    plist_file = "#{ENV['HOME']}/Library/Preferences/com.macromates.textmate.plist"
    `plutil -convert xml1 #{plist_file}`
    tmate_plist = Plist::parse_xml(plist_file)
    tmate_plist["OakTextViewLineNumbersEnabled"] = true
    tmate_plist["OakTextViewScopedSoftTabs"] = 
      { "source.catch-all" => 
	{ "softTabs" => false, 
	  "updated" => Time.parse("2011-07-14T18:59:17Z") 
	},
	"source.plist" =>
	{ "softTabs" => true, 
	  "updated" => Time.parse("0000-12-30T00:00:00Z") 
	},
	"source.ruby" =>
	{ "softTabs" => true, 
	  "updated" => Time.parse("0000-12-30T00:00:00Z") 
	},
	"source.yaml" =>
	{ "softTabs" => true, 
	  "updated" => Time.parse("0000-12-30T00:00:00Z") 
	},
	"text.catch-all" => 
	{ "softTabs" => false, 
	  "updated" => Time.parse("2011-07-14T18:59:17Z") 
	},
	"text.plain" =>
	{ "softTabs" => true, 
	  "updated" => Time.parse("0000-12-30T00:00:00Z") 
	}
      }
    tmate_plist["OakTextViewScopedTabSize"] = 
      { "source.catch-all" => 
	{ "tabSize" => 4, 
	  "updated" => Time.parse("2011-07-14T18:59:17Z") 
	},
	"source.plist" =>
	{ "tabSize" => 2, 
	  "updated" => Time.parse("0000-12-30T00:00:00Z") 
	},
	"source.ruby" =>
	{ "tabSize" => 2, 
	  "updated" => Time.parse("0000-12-30T00:00:00Z") 
	},
	"source.yaml" =>
	{ "tabSize" => 2, 
	  "updated" => Time.parse("0000-12-30T00:00:00Z") 
	},
	"text.catch-all" => 
	{ "tabSize" => 4, 
	  "updated" => Time.parse("2011-07-14T18:59:17Z") 
	},
	"text.plain" =>
	{ "tabSize" => 2, 
	  "updated" => Time.parse("0000-12-30T00:00:00Z") 
	}
      }
    puts Plist::Emit.dump(tmate_plist["OakTextViewScopedTabSize"])
    plist_handle = File.open(plist_file, "w")
    plist_handle.puts Plist::Emit.dump(tmate_plist)
  end
  user WS_USER
end
