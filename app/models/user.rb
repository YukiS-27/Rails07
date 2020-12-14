class User < ApplicationRecord
  # バリデーション：入力されたデータが有効なものかどうかをチェックする
  # validatesメソッドを使う
  
  # ユーザ名の形式を制限（長さ：15文字まで）
  validates :name, presence: true, length: { maximum: 15 }
  
  # メールアドレスの形式を制限「---@---.---」
  VALID_EMAIL_REGEX = /\A[\w+\-._]+@[\w+\-._]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
  # パスワードの長さを8〜32文字に制限、英数字混合
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/     # ?= → 肯定先読み？
  validates :password, length: { in: 8..32 },
                        format: { with: VALID_PASSWORD_REGEX }
  
  # パスワードの実装
  has_secure_password
  
end


__END__

  has_secure_passwordを使うことで以下が実装可能
    
    ・暗号化されたパスワードをデータベースのpassword_digestというカラムに保存できる。
    ・password_confirmatino（パスワード確認用の再入力）が使えるようになる。
    　また、存在性と値が一致するかどうかのバリデーションも追加される。
    ・authenticateメソッドが使えるようになる。⇛引数の文字列がパスワードと一致したかどうかをtrue/faleseで返す
    
    user = User.find_by(params[:email])
    if user && user.authenticate(params[:password])
      与えられたemail, passwordのユーザーが存在する場合の処理をここに記述する
    end