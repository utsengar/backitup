#/Users/utkarsh/Desktop/folderName
module Helpers
    
    #Create Zip file
    def createZip(folderPath)
      require 'zip/zip'
      require 'find'
      require 'fileutils'
      
      creationTime = Time.now
      
      new_zip_file = folderPath+"/Backup:" + creationTime.strftime("%Y-%m-%d").to_s + ".zip"
      
      if(!File.exists?(new_zip_file))
        
        Zip::ZipFile.open(new_zip_file, Zip::ZipFile::CREATE) do |zipfile|
          Find.find(folderPath) do |path|
            dest = /\/(\w.*)/.match(path)
            zipfile.add(dest[1],path) if dest
          end
        end
      end
    end
      
    #Check time and create backup, input time in format HHMM
    def checkTime(inputTime, folderPath)
      while(true)
        hour = Time.now.hour.to_s
        minutes = Time.now.min.to_s
        if(minutes.length == 1)
        minutes = "0" + minutes
        end
        currentTime = hour + minutes
        
        #Call the create zip method once a day
        if currentTime == inputTime
          createZip(folderPath)
          sleep(86390)
        end
      end
    end
end