# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module scryfall
  module Models
    #
    # Model object.
    #
    #
    class CardList
      # @return [Integer]
      attr_accessor :total_cards

      # @return [Boolean]
      attr_accessor :has_more

      # @return [String]
      attr_accessor :next_page

      # @return [Array<Card>]
      attr_accessor :data


      #
      # Mapper for CardList class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'card_list',
          type: {
            name: 'Composite',
            class_name: 'CardList',
            model_properties: {
              total_cards: {
                client_side_validation: true,
                required: false,
                serialized_name: 'total_cards',
                type: {
                  name: 'Number'
                }
              },
              has_more: {
                client_side_validation: true,
                required: false,
                serialized_name: 'has_more',
                type: {
                  name: 'Boolean'
                }
              },
              next_page: {
                client_side_validation: true,
                required: false,
                serialized_name: 'next_page',
                type: {
                  name: 'String'
                }
              },
              data: {
                client_side_validation: true,
                required: false,
                serialized_name: 'data',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'CardElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'Card'
                      }
                  }
                }
              }
            }
          }
        }
      end
    end
  end
end