json.host_name @message.host.name
json.cast_name @message.cast.name
json.gest_name @message.gest.name
json.created_at @message.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.content @message.content
json.image @message.image_url
json.id @message.id