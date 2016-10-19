
# # Seleccionar 23 elementos aleatorios entre 0 y 10.000
# arr = (1..10000).to_a.sample(23)
# puts "Selección de 23 números aleatorios..."
# p arr
# puts "\n\n"

# # Seleccionar unicamente los elementos que divido 3 den un resto = 0
# # utilizando el operador % (modulo)
# puts "Seleccion de números divisibles por 3"
# p arr.select { |element| element % 3 == 0 }
# puts "\n\n"

# #Utilizando el metodo 'reject' filtrar aquellos elementos menores a 5000
# #y utilzar 'sort' y 'reverse' para ordenar de forma descendente
# #Implementar todo esto en una sola linea de código
# puts "Resultado final: "
# #p arr.select { |element| element % 3 == 0 }
# puts "\n\n"

puts arr = (1..10000).select { |element| element % 3 == 0 }.to_a.sample(23).reject {|n| n < 5000}.sort.reverse.to_a.sample(6)