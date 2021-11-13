json.call(member, :id, :email, :name, :mobile)

json.auth_token member.generate_jwt
