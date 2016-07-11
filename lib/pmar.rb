require 'pry'
class PryMeARiver

  def search_and_change(arg1, arg2)
    Dir.glob('../**/**.rb').each do |file|
     unless file.include?('pmar/lib/pmar')
        original_text = File.read(file) 
        new_text = original_text.gsub("#{arg1}", "#{arg2}")
        File.open(file, "w") { |file| file << new_text }
      end
    end
  end

  def run
    self.search_and_change("binding.pry ", "#binding.pry ")
    self.search_and_change("\nbinding.pry", "\n#binding.pry")
  end

end

pmar = PryMeARiver.new
pmar.run

# @@input_flag = ARGV

# if @@input_flag.include?("-co")
#    self.search_and_change("##binding.pry", "##binding.pry")
#   self.search_and_change("\n#binding.pry", "\n##binding.pry")
 
# elsif @@input_flag.include?("-r")
#   self.search_and_change("##binding.pry", "")
#   self.search_and_change("\n#binding.pry", "\n")
    
# elsif @@input_flag.include?("-ci")
#   self.search_and_change("##binding.pry", "#binding.pry")
#   self.search_and_change("\n##binding.pry", "\n#binding.pry")
# end