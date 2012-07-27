$list = {
  "A" => ["C","D","E"],
  "B" => ["C","F"],
  "C" => ["A","B","D","F","E"],
  "D" => ["A","C","E"],
  "E" => ["A","C","D"],
  "F" => ["B","C"]
 }

class Tree
  class << self
    def bfs list
      queue = ["A"]
      visited = {"A"=>true}
      print "A "
      while(!queue.empty?)
        do_print = false
        node = queue.pop()
        list[node].each do |child|
          if visited[child] != true then
            print "#{child} "
            queue.push(child)
            visited[child] = true
            do_print = true
          end
        end
        if do_print == true
          #print "\n "
        end
      end
    end
  end
end

result = Tree.bfs $list
puts result.inspect