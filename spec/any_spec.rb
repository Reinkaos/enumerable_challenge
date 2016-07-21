# any? [{ |obj| block }] -> true or false
# Passes each element of the collection to the given block.
# The method returns true if the block ever returns
# a value other than false or nil.
# If the block is not given, Ruby adds an implicit block of { |obj| obj }
# that will cause any? to return true if at least one of the
# collection members is not false or nil.

RSpec.describe 'any?' do
  context 'it returns true' do
    after do
      expect(@example).to eq true
    end

    it 'returns true when any of the words are greater than 3 chars' do
      @example = %w(a hello no).any? { |w| w.length > 3 }
    end

    it 'returns true when any of the elements are an integer' do
      @example = [1, 'two', 'three'].any? { |i| i.is_a? Integer }
    end
  end

  context 'it returns false' do
    after do
      expect(@example).to eq false
    end

    it 'returns false when none of the words are greater than 3 chars' do
      @example = %w(a b c).any? { |w| w.length > 3 }
    end

    it 'returns false when none of the elements are an integer' do
      @example = %w('one', 'two', 'three').any? { |i| i.is_a? Integer }
    end
  end
end
