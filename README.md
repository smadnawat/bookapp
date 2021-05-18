# README

Models :

	User and Book
	User can create number of books
	User can update or delet it's own book
	User login required to create, update or see it's own books
	After login user can see a list of books created by him/her

About usage:

Versions :
	Rails : rubyRails 5.2.6
	Ruby : ruby 2.6.0p0 (2018-12-25 revision 66547) [x86_64-darwin18]
	Database : Postgresql
	Authentication : Devise Rails

API usage :
	For user :
		login - get : /api/v1/users/login?email=user@example.com&password=password
		logout - get : /api/v1/users/logout?email=user@example.com
		rigister new user - post : /api/v1/users/register
					params : {email, password, confirm_password}
					
	For books :
		my books - get : /api/v1/books
		create books - post : /api/v1/books
				params : {name, author_name, publish_year}
				
		update books - put : /api/v1/books/:id
		delete books - delete : /api/v1/books/:id
