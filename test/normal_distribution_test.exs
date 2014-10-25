defmodule NormalDistributionTest do
  use ExUnit.Case, async: true
  doctest Statistics.Distributions.Normal

  alias Statistics.Distributions.Normal, as: Norm

  test "output of the pdf function" do
    assert Norm.pdf(0) == 0.3989422804014327
    assert Norm.pdf(3, 0.2, 1) == 0.00791545158297997
    assert Norm.pdf(-1) == 0.24197072451914337
    assert Norm.pdf(22.0, 23.5, 1.7) == 0.15900173884840293
  end

  test "return a cdf " do
    assert Norm.cdf(2) == 0.9772499371127437
    assert Norm.cdf(0) == 0.5000000005
    assert Norm.cdf(2.8, 2, 2.5) == 0.6255157658802836
    assert Norm.cdf(2, 2, 2.5) == 0.5000000005
  end

  test "return a normally-distributed random number" do
    assert Norm.rnd == 0.0
  end

end
