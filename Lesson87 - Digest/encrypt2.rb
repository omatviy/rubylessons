# encoding utf-8

if Gem.win_platform?
    Encoding.default_external = Encoding.find(Encoding.locale_charmap)
    Encoding.default_internal = __ENCODING__
  
    [STDIN, STDOUT].each do |io|
      io.set_encoding(Encoding.default_external, Encoding.default_internal)
    end
end

require 'digest'
  
puts "Введіть стрічку для шифрування"
string = STDIN.gets.chomp
puts "Введена стрічка #{string}"

puts "Введіть метод шифрування:"
puts "1.MD5"
puts "2.SHA1"
encrypt_method = STDIN.gets.chomp.to_i

until (1..2).include?(encrypt_method) 
    puts "Введіть метод шифрування:"
    puts "1.MD5"
    puts "2.SHA1"
    encrypt_method = STDIN.gets.chomp.to_i    
end

encrypted_string = case encrypt_method
    when 1
        Digest::MD5.hexdigest(string)
    when 2
        Digest::SHA1.hexdigest(string)

end

puts "Шифрована стрічка: #{encrypted_string}"
