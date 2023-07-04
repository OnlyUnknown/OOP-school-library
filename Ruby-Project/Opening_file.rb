require 'json'
def writeFile(file,data)
    field = File.read("Ruby-Project/#{file}")
    newarr = JSON.parse(field)
    newarr.push(data)
   newData = JSON.generate(newarr)
    File.write("Ruby-Project/#{file}",newData)
end

def ifEmpty(file,list)

        parse = File.read("Ruby-Project/#{file}")
      list = JSON.parse(parse)
end
