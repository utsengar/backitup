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
      
    #Check time and create backup, input time in format HH:MM
    def checkTime(inputTime, folderPath, duration)
      require 'Date'
      
      #Get kill date
      killDate = Date.today + duration.to_i
      
      #Check the differnce of current time and input time and sleep for the difference - one time only START
      hourSleep = Time.now.hour.to_s
      minutesSleep = Time.now.min.to_s
      
      inputTimeForSleep = inputTime.split(':')
      diffHour = (inputTimeForSleep[0].to_i - hourSleep.to_i).abs
      diffMin = (inputTimeForSleep[1].to_i - minutesSleep.to_i).abs
      totalSeconds = diffHour*60*60 + diffMin*60
      sleep(totalSeconds-10)
      #Check the differnce of current time and input time and sleep for the difference - one time only END
      
      while(Date.today != killDate)
        hour = Time.now.hour.to_s
        minutes = Time.now.min.to_s
        if(minutes.length == 1)
        minutes = "0" + minutes
        end
        currentTime = hour + ":" + minutes
        
        #Call the create zip method once a day
        if currentTime == inputTime
          createZip(folderPath)
          sleep(86390) #wakes up 10 seconds prior to the job
        end
      end
    end
end