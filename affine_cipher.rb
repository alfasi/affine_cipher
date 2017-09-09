#!/usr/bin/ruby

# Created by Matan Alfasi 09/09/17

$words = []

File.open('enable1.txt', 'r').read.each_line do |line|
  $words.push(line.strip)
end

def main()
  command = ARGV[0]

  if command == 'encrypt'
    puts encrypt_message(ARGV[1].to_i, ARGV[2].to_i, ARGV[3..-1].join(' '))
  elsif command == 'decrypt'
    puts decrypt_message(ARGV[1..-1].join(' '))
  else
    puts '$ ruby affine_cipher.rb {encrypt,decrypt} [a, b] {message}'
  end
end

def encrypt_message(a, b, original_message)
  chars_to_encrypt = ('a'..'z').to_a
  encrypted_message = ''

  original_message.downcase.split('').each do |c|
    encrypted_message += if chars_to_encrypt.include? c then ((((c.ord - 'a'.ord).abs * a + b) % 26) + 'a'.ord).chr else c end
  end

  return encrypted_message.upcase
end

def decrypt_message(encrypted_message)
  chars_to_decrypt = ('a'..'z').to_a
  all_messages = {}

  [1, 3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25].each do |a|
    (0..25).to_a.each do |b|
      message = ''

      encrypted_message.downcase.split('').each do |c|
        message += if chars_to_decrypt.include? c then ((((c.ord - 'a'.ord).abs * a + b) % 26) + 'a'.ord).chr else c end
      end

      all_messages[message] = score_message(message)
    end
  end

  sorted_messages = all_messages.keys.sort_by { |msg| all_messages[msg] }

  return sorted_messages[-1]
end

def score_message(message)
  score = 0

  $words.each do |word|
    if message.include? word
      score += 1
    end
  end

  return score
end


if __FILE__ == $0
  main()
end
