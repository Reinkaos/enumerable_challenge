# all? [{ |obj| block } ] -> true or false
# Passes each element of the collection to the given block.
# The method returns true # if the block never returns false or nil.
# If the block is not given, Ruby adds an # implicit block of { |obj| obj }
# which will cause all? to return true when none of # the collection members
# are false or nil.

RSpec.describe 'all?' do
  it 'returns true when all of the words are greater than 3' do
    example = %w(ant bear cat).all? { |w| w.length >= 3 }
    expect(example).to eq true
  end

  it 'returns false when all of the words are not greater than 5' do
    example = %w(ant bear cat dog).all? { |w| w.length >= 5 }
    expect(example).to eq false
  end

  # This is the implicit block of { |obj| obj }
  it 'returns false when there is a nil value provided' do
    example = [nil, true, 99].all?
    expect(example).to eq false
  end

  it 'returns true when all of the values are not false or nil' do
    example = [100, 500, 1].all?
    expect(example).to eq true
  end

  it 'returns true because all of the elements in the array are integers' do
    example = [100, 500, 1].all? { |w| w.is_a? Integer }
    expect(example).to eq true
  end
end
