defmodule PoissonDistributionTest do
  use ExUnit.Case, async: true
  doctest Statistics.Distributions.Poisson, except: [rand: 1]

  alias Statistics.Distributions.Poisson
  alias Statistics.Math

  test "output of the pmf function" do
    assert Poisson.pmf(1).(1) == 0.36787944117144233
    assert Poisson.pmf(10).(10) == 0.1251100357211333
    assert Poisson.pmf(10).(4) == 0.018916637401035358
  end

  test "return a cdf " do
    assert Poisson.cdf(1).(1) == 0.73575888234288467
    assert Poisson.cdf(10).(5) == 0.06708596287903179
  end

  test "get the percentile point value" do
    assert Poisson.ppf(1).(0.95) == 3.0
    assert Poisson.ppf(10).(0.05) == 5.0
    assert Poisson.ppf(32).(0.75) == 36.0
    assert Poisson.ppf(62).(0.05) == 49.0
  end

  test "random number generation" do
    r = Poisson.rand(10)
    assert Math.floor(r) == r
  end
end
