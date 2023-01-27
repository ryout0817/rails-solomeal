module RecipesHelper
  def placeholder_method
    <<~"EOS"
      例：
      1.ニラを3cmずつにきります。
      2.ニラを切った後にんにくのすりおろしを炒めます。
    EOS
  end

  def placeholder_material
    <<~"EOS"
      例：
      1.豚肉     200グラム
      2.ニラ     一袋の半分
      3.しょうゆ  大さじ1.5
    EOS
  end
end
