require 'pg'
require 'active_support/all'

begin

    con = PG.connect :dbname => 'TimeDetector_development', :user => 'postgres', :password => 'postgres'
    inTimedata = Array.new
    outTimedata = Array.new
    totalInTime = 0
    totalOutTime = 0
    totalTime = 0

    rs = con.exec "SELECT * FROM inputs"
    rs.each do |row|
      #puts "InTime:%s OutTime:%s" % [ row['InTime'], row['OutTime'] ]
      inTimedata.push(row['InTime'])
      outTimedata.push(row['OutTime'])
      totalTime = totalTime + (((row['OutTime'].to_datetime) - (row['InTime'].to_datetime)) *24 * 60).to_i
    end
    
    # i = 0
    # len = inTimedata.length
    # until i > len do
    #     totalInTime = totalInTime + (((inTimedata[i+1].to_datetime) - (inTimedata[i].to_datetime)) *24 * 60).to_i
    #     i = i+1
    # end
    

    #print "\nTotal Time: " totalOutTime
    puts "\nTotal Time the light will be on: #{totalTime} mins."
    #print ((date1 - date) * 24 * 60).to_i
    # start_date = "2018-06-23 13:49:00".to_datetime
    # end_date = "2018-06-23 13:52:00".to_datetime
    # print end_date - start_date
    
rescue PG::Error => e

    puts e.message 
    
ensure

    rs.clear if rs
    con.close if con
    
end