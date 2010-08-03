#/Users/utkarsh/Desktop/folderName
require 'daemons'
require File.join(File.dirname(__FILE__), "lib",'helpers')
include Helpers


class Backitup
  def main
    folderPath = ARGV[0] #folder  path
    time = ARGV[1] #time in HH:MM format
    duration = ARGV[2]   #In days
    if folderPath.nil? || time.nil? || duration.nil?
      puts "Please enter all the required parameters"
    else
      options = {
        :backtrace  => true,
        :ontop      => false
      }
      
      Daemons.daemonize
      checkTime(time.to_s, folderPath, duration)
    end
  end
end


#Program entry
mainObject = Backitup.new
mainObject.main()