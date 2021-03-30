class Logic
  def win_logic
    win = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[3,5,7],[1,5,9]]
  end

  def get_param1(arr1)
    param1 = win.map {|a| a.intersection(arr1.sort)}.select {|a| a.length == 3}
  end

  def get_param2(arr2)
    param2 = win.map {|a| a.intersection(arr2.sort)}.select {|a| a.length == 3}
  end

  def check_win (param1, param2)
    if win.include? param1
      return "#{@p1} wins"
    else win.include? param2
      return "#{@p2} wins"
    end
  end

end