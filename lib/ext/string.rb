class String

  def methodize
    gsub(/([A-Z]+)([A-Z])/,'\1_\2').
        gsub(/([a-z])([A-Z])/,'\1_\2').
        gsub('/' ,'__').
        gsub('::','__').
        gsub(' ','_').
        downcase
  end

end