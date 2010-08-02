#/Users/utkarsh/Desktop/folderName
require File.join(File.dirname(__FILE__), "lib",'helpers')
include Helpers


class Backitup
  
  def main
  
  puts "Please give the full path of the folder"
  STDOUT.flush  
  folderPath = gets.chomp
  puts "Please give the time you want BackItUp to backup the data everyday (24hr format: 0230 means 2:30AM)"
  time = gets.chomp
  checkTime(time.to_s, folderPath)
  end
end


#Program entry
mainObject = Backitup.new
mainObject.main()