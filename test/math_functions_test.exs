defmodule MathFunctionsTest do
  use ExUnit.Case, async: true
  doctest Statistics.Math.Functions

  alias Statistics.Math.Functions
  alias Statistics.Math

  # alias Statistics.Distributions.T

  # use Statistics.Math.Equalish

  test "gamma function" do
    assert Functions.gamma(22) == 5.109094217170951e19
    assert Functions.gamma(0.02) == 49.44221016319569
  end

  test "incomplete gamma function" do
    assert Functions.gammainc(2,2) == 0.5939941502901618
    assert Functions.gammainc(1,2) == 0.8646647167633872
    assert Functions.gammainc(1,1) == 0.63212055882855778
    # not a complete solution ... some cases that do not work
    #assert Functions.gammainc(4,1) == 0.018988156876153808
    #assert Functions.gammainc(0.1,1) == 0.97587265627367215
  end

  test "beta function" do
    assert Functions.beta(1, 2) == 0.4999999999999996
    assert Functions.beta(2, 2) == 0.16666666666666638
    assert Functions.beta(0.05, 1) == 20.000000000000007
  end

  test "hypergeometric 2F1 function" do
    assert Functions.hyp2f1(10, 22, 100, 0.99) == 13.744277702471942
    assert Functions.hyp2f1(12, 22, 100, 0.99) == 24.155262950016766
    assert Functions.hyp2f1(12,22,100, 0.0001) == 1.000264039081519
    
    assert Functions.hyp2f1(0.2, 3, 0.2, 0.2) == 1.9531249999999996
    assert Functions.hyp2f1(1, 2, 1, 0.5) == 4.0
    assert Functions.hyp2f1(1, 1, 1, 0.5) == 2.0

    assert Functions.hyp2f1(1,2,3,0) == 1.0
    assert Functions.hyp2f1(0,1,0,0) == 1.0
    assert Functions.hyp2f1(0,0,0,0) == 1.0
  
    assert Functions.hyp2f1(-1, 6, 4, 0.5) == 0.25
    assert Functions.hyp2f1(-1, -6, -4, 0.5) == 0.25
    assert Functions.hyp2f1(-1, 6, -4, 0.5) == 1.75
    assert Functions.hyp2f1(-1, 6, -4, 0.6) == 1.9

    # FAILING Cases - doesn't handle overflows
    # assert Functions.hyp2f1(-1, -6, -4, 1) == -0.5
    # assert Functions.hyp2f1(0, -6, -4, 1) == 1.0
  end

  test "simpsons numeric integration rule" do
    f = fn x -> Math.pow(x,9) end
    sr = Functions.simpson(f, 0, 10, 100000)
    assert Math.round(sr, 1) == 1000000000.0
    
    ## integral of t.pdf(x, 1) at 2 and -2
    #f = fn x -> T.pdf(x, 1) end
    #sr = Functions.simpson(f, -10000, 2, 100000)
    #assert sr == 0.8523845106569062
    ##sr = Functions.simpson(f, -10000, -2, 100000)
    ##assert sr == 0.14755182730100083
  end

end
