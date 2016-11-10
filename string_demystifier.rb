class StringDemystifier
  
  def initialize
    @string = "!YTIRCO!IQIIQIDEMGMMIM FO YMJMMSM!RA !EGEEJEHT ROEOOSOF PAEJEEBEL TN!AIKIITIG ENVNNMNO ,GQGGCGN!ILEKIZIISIRT A RJRRDROF PETOTTJTS LLZLLEL!AMSXSSMS ENODOOSO"
  end
    
  def demystify
    demystify_process1
    demystify_process2
    demystify_process3

    @string 
  end

  def demystify_process1
    #Replace sub str like sos, oso...... to sss or ooo
    ("A".."Z").to_a.each do |c| 
      @string.gsub!(Regexp.new("#{c}[A-Z]{1}#{c}"), c*3)
    end
  end

  def demystify_process2
    #Replace sub str like ssssss, oooooo...... to s or o
    ("A".."Z").to_a.each do |c|  
      @string.gsub!(Regexp.new(c*6), c)
    end
    
    #We can also use below for this case, but may be possible it's not working with random strings 
    #@string.squeeze!
  end

  def demystify_process3
    #Remove ! and reverse str
    @string = @string.split(" ").collect{|s| s.reverse }.reverse.join(" ").gsub("!", "")
  end
    
end

demystifier_string = StringDemystifier.new
puts demystifier_string.demystify
#Output : ONE SMALL STEP FOR A TRIKELING, ONE GIANT LEAP FOR THE ARMY OF MEDIOCRITY
