# coding: utf-8
require 'spec_helper'

class Foo
  def self.foo
    "FOO"
  end

  def initialize(bar)
    @bar = bar
  end

  def bar
    @bar
  end
end

describe "Foo" do
  describe ".foo" do
    it "'FOO' を返す" do
      Foo.foo.should == 'FOO'
    end
  end

  describe "#bar" do
    context "'hoge' で初期化したとき" do
      before do
        @foo = Foo.new('hoge')
      end

      it "'hoge' を返す" do
        @foo.bar.should == 'hoge'
      end
    end
  end
end
