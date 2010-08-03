#/Users/utkarsh/Desktop/folderName
require 'daemons'
require File.join(File.dirname(__FILE__), "lib",'helpers')
include Helpers


class Backitup
  def main
    folderPath = ARGV[0]
    time = ARGV[1]
    if folderPath.nil? || time.nil?
      puts "Please enter all the required parameters"
    else
      Daemons.daemonize
      checkTime(time.to_s, folderPath)
    end
  end
end


#Program entry
mainObject = Backitup.new
mainObject.main()