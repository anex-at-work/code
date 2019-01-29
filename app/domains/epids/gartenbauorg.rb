module Domains
  module Epids
    class Gartenbauorg
      def output
        {
          description: @data[:comment],
          data: {
            project_deadline: @data[:details].try(:project_deadline),
            "size": "30,00 m hight 13,00 m width"
          },
          "epid": "gartenbauorg",
          "trade_slug": "gartenbau",
          "order_type": "other",
          "address_attributes": {
            "line_1": "schoenerhauser alle 6-7",
            "postal_code": "10119",
            "city": "berlin"
          },
          "contact_attributes": {
            "gender": "male",
            "first_name": "John",
            "last_name": "Cruz",
            "email": "john@example.com",
            "fix_phone": "+49123213223",
            "mobile_phone": "03023131"
          },
          "cipid":"SLUG YOU HAVE GOT FROM DS TEAM"
        }
      end
    end
  end
end
