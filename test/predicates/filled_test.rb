require 'test_helper'

describe 'Predicates: Filled' do
  describe 'with key' do
    before do
      @validator = Class.new do
        include Hanami::Validations

        key(:foo) { filled? }
      end
    end

    describe 'with valid input (array)' do
      let(:input) { { foo: [23] } }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'has not error messages' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with valid input (hash)' do
      let(:input) { { foo: { bar: 23 } } }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'has not error messages' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with missing input' do
      let(:input) { {} }

      it 'is not successful' do
        result = @validator.new(input).validate
        result.wont_be :success?
      end

      it 'returns error message' do
        result = @validator.new(input).validate
        result.messages.fetch(:foo).must_equal ['is missing']
      end
    end

    describe 'with nil input' do
      let(:input) { { foo: nil } }

      it 'is not successful' do
        result = @validator.new(input).validate
        result.wont_be :success?
      end

      it 'has error messages' do
        result = @validator.new(input).validate
        result.messages.fetch(:foo).must_equal ['must be filled']
      end
    end

    describe 'with blank input' do
      let(:input) { { foo: '' } }

      it 'is not successful' do
        result = @validator.new(input).validate
        result.wont_be :success?
      end

      it 'has error messages' do
        result = @validator.new(input).validate
        result.messages.fetch(:foo).must_equal ['must be filled']
      end
    end

    describe 'with invalid input' do
      let(:input) { { foo: [] } }

      it 'is not successful' do
        result = @validator.new(input).validate
        result.wont_be :success?
      end

      it 'returns error message' do
        result = @validator.new(input).validate
        result.messages.fetch(:foo).must_equal ['must be filled']
      end
    end
  end

  describe 'with optional' do
    before do
      @validator = Class.new do
        include Hanami::Validations

        optional(:foo) { filled? }
      end
    end

    describe 'with valid input (array)' do
      let(:input) { { foo: [23] } }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'has not error messages' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with valid input (hash)' do
      let(:input) { { foo: { bar: 23 } } }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'has not error messages' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with missing input' do
      let(:input) { {} }

      it 'is successful' do
        result = @validator.new(input).validate
        result.must_be :success?
      end

      it 'has not error messages' do
        result = @validator.new(input).validate
        result.messages[:foo].must_be_nil
      end
    end

    describe 'with nil input' do
      let(:input) { { foo: nil } }

      it 'is not successful' do
        result = @validator.new(input).validate
        result.wont_be :success?
      end

      it 'has error messages' do
        result = @validator.new(input).validate
        result.messages.fetch(:foo).must_equal ['must be filled']
      end
    end

    describe 'with blank input' do
      let(:input) { { foo: '' } }

      it 'is not successful' do
        result = @validator.new(input).validate
        result.wont_be :success?
      end

      it 'has error messages' do
        result = @validator.new(input).validate
        result.messages.fetch(:foo).must_equal ['must be filled']
      end
    end

    describe 'with invalid input' do
      let(:input) { { foo: [] } }

      it 'is not successful' do
        result = @validator.new(input).validate
        result.wont_be :success?
      end

      it 'returns error message' do
        result = @validator.new(input).validate
        result.messages.fetch(:foo).must_equal ['must be filled']
      end
    end
  end
end
