Drop Database FLOWERSHOP
CREATE DATABASE FLOWERSHOP
GO
USE FLOWERSHOP
GO
CREATE TABLE ThanhVien
(
	MaTV		int			not null,
	HoTen		nvarchar(30)	null,
	TaiKhoan	nvarchar(30)	null,
	MatKhau		nvarchar(30)	null,
	DienThoai	nvarchar(30)	null,
	Email		nvarchar(30)	null,
	DiaChi		nvarchar(30)	null,
	NgayTao		date			null,
	TrangThai	bit				null,
	CONSTRAINT PK_ThanhVien PRIMARY KEY(MaTV)
);
CREATE TABLE AD
(
	MaAD		int			not null,
	HoTen		nvarchar(30)	null,
	TaiKhoan	nvarchar(30)	null,
	MatKhau		nvarchar(30)	null,
	Email		nvarchar(30)	null,
	NgayTao		date			null,
	PhanQuyet	nvarchar(30)	null,
	TrangThai	bit				null,
	CONSTRAINT PK_AD PRIMARY KEY(MaAD)
);
CREATE TABLE HinhAnh
(
	MaAnh		int			not null,
	ViTri		varchar(max)	null,
	TrangThai	bit				null,
	CONSTRAINT PK_HinhAnh PRIMARY KEY(MaAnh)
);
CREATE TABLE SanPham
(
	MaSP		int			not null,
	MaNhom		int				null,
	TenSP		nvarchar(500)	null,
	GiaSP		float			null,
	GiaKM		float			null,
	MoTa		nvarchar(4000)	null,
	SoLuong		int				null,
	TrangThai	bit				null,
	CONSTRAINT	PK_SanPham	PRIMARY KEY(MaSP)
);
CREATE TABLE BinhLuan
(
	Mail		nvarchar(30) not null,
	MaTV		int				 null,
	MaSP		int				 null,
	NoiDungBL	nvarchar(4000)	 null,
	NgayDang	date			 null,
	TrangThai	bit				 null,
	CONSTRAINT PK_BinhLuan PRIMARY KEY(Mail)				
);
CREATE TABLE AnhSP
(
	MaSP		int			 not null,
	TenAnh		nvarchar(50)	 null,
	DuongDan	varchar(max)	 null,
	CONSTRAINT PK_AnhSP PRIMARY KEY(MaSP)
);
CREATE TABLE NhomSP
(
	MaNhom		int			 not null,
	TenNhom		nvarchar(500)	 null,
	TrangThai	bit				 null,
	CONSTRAINT PK_NhomSP PRIMARY KEY(MaNhom)
);
CREATE TABLE HoaDon
(
	MaHD		int			 not null,
	MaTV		int				 null,
	MaSP		int				 null,
	MaTT        int				 null,
	TenKH		nvarchar(30)     null,
	DienThoai	int				 null,
	Email		nvarchar(50)	 null,
	DiaChi		nvarchar(2000)	 null,
	NgayBan		date			 null,
	NgayGiao	date			 null,
	TrangThai	bit				 null,
	CONSTRAINT PK_HoaDon PRIMARY KEY(MaHD)
);
CREATE TABLE ThanhToan
(
	MaTT		int			 not null,
	GhiChu		nvarchar(4000)	 null,
	TrangThai	bit				 null,
	CONSTRAINT	PK_ThanhToan PRIMARY KEY(MaTT)
);
CREATE TABLE ChiTietHD
(
	MaHD		int			 not null,
	MaSP		int			 not null,
	MaCTSP		int			 not null,
	SoLuong		int				 null,
	GiaSP		float			 null,
	CONSTRAINT PK_ChiTietHD PRIMARY KEY(MaHD, MaSP, MaCTSP)
);
-------------FOREIGN KEY----------------
 ALTER TABLE BinhLuan  ADD CONSTRAINT  FK_BinhLuan_ThanhVien  FOREIGN KEY(MaTV)   REFERENCES ThanhVien(MaTV);
 ALTER TABLE BinhLuan  ADD CONSTRAINT  FK_BinhLuan_SanPham    FOREIGN KEY(MaSP)   REFERENCES SanPham(MaSP);
 ALTER TABLE HoaDon	   ADD CONSTRAINT  FK_HoaDon_ThanhVien    FOREIGN KEY(MaTV)   REFERENCES ThanhVien(MaTV);
 ALTER TABLE HoaDon	   ADD CONSTRAINT  FK_HoaDon_SanPham      FOREIGN KEY(MaSP)   REFERENCES SanPham(MaSP);
 ALTER TABLE HoaDon	   ADD CONSTRAINT  FK_HoaDon_ThanhToan    FOREIGN KEY(MaTT)	  REFERENCES ThanhToan(MaTT);
 ALTER TABLE ChiTietHD ADD CONSTRAINT  FK_ChiTietHD_HoaDon	  FOREIGN KEY(MaHD)   REFERENCES HoaDon(MaHD);
 ALTER TABLE ChiTietHD ADD CONSTRAINT  FK_ChiTietHD_SanPham   FOREIGN KEY(MaSP)   REFERENCES SanPham(MaSP);
 ALTER TABLE AnhSP	   ADD CONSTRAINT  FK_AnhSP_SanPham       FOREIGN KEY(MaSP)   REFERENCES SanPham(MaSP);
 ALTER TABLE SanPham   ADD CONSTRAINT  FK_SanPham_NhomSP      FOREIGN KEY(MaNhom) REFERENCES NhomSP(MaNhom);
 ----Them dl nhóm sp----
insert into NhomSP(MaNhom, TenNhom, TrangThai) values(1, N'Hoa Sen', 1);
insert into NhomSP(MaNhom, TenNhom, TrangThai) values(2, N'Hoa Hồng', 1);
insert into NhomSP(MaNhom, TenNhom, TrangThai) values(3, N'Hoa Tulip', 1);
insert into NhomSP(MaNhom, TenNhom, TrangThai) values(4, N'Hoa Mẫu Đơn', 1);
insert into NhomSP(MaNhom, TenNhom, TrangThai) values(5, N'Hoa Baby', 1);
insert into NhomSP(MaNhom, TenNhom, TrangThai) values(6, N'Hoa Cẩm Tú Cầu', 1);
insert into NhomSP(MaNhom, TenNhom, TrangThai) values(7, N'Hoa Cúc Nhỏ', 1);
insert into NhomSP(MaNhom, TenNhom, TrangThai) values(8, N'Hoa Ly', 1);
 ------------Them san pham------
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (11,1,N'Hoa Sen Quan Âm Hồng',59000,39000,N'cánh hoa kép, màu hồng, hương thơm lâu và đượm. Đây là loài sen duy nhất dùng để ướp trà sen, loại trà “thượng hạng” với giá trị có khi lên tới cả chục triệu đồng một kilogam.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (12,1,N'Super Lotus',59000,39000,N'là giống sen ngoại nhập, dễ trồng và sinh trưởng rất khỏe. Giống sen nghìn cánh này nở to rất  bền đẹp. Thích hợp dùng để lấy hoa cắm lọ, làm cảnh, lấy ngó, lấy lá làm trà.  Super lotus có thể trồng chậu cảnh và ở ao hồ, ruộng.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (13,1,N'Sen Lucky Pink',59000,39000,N'Giống sen mini nhập này nở hoa phát triển quanh năm. Sen mini không cần diện tích quá lớn như kiểu giống sen trồng đầm lầy nên không gian thích hợp trồng ở phòng khách, mái hiên, ban công, trồng trong chậu nhỏ để bàn.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (14,1,N'Droop Blood',59000,39000,N'Cây hoa sen nhập đỏ huyết Drop Blood là một trong 6 dòng sen quý hiếm được cộng đồng yêu hoa sen tại Việt Nam săn đón. Hoa có cấu tạo nhiều tầng cánh với từ 5 đến 8 lớp cánh hoa màu đỏ đậm, hoa có đường kính từ 18 đến 25 cm có lớp cánh ngoài cùng to nhất, tiếp đến là những lớp cánh trong có tiết diện cánh nhỏ hơn cánh ngoài một chút, cánh hoa mang màu đỏ chói khi nhìn từ xa trông bông Sen huyết như ngọn lửa đỏ chói đang tỏa sáng rực rỡ mang đến cảm giác hứng khởi, thu hút thị giác bởi gam màu mạnh.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (15,1,N'Golden Monekey',59000,39000,N'Sen cánh đơn, màu vàng thơm đậm, đầu cánh phớt hồng, phom cánh xòe nhảy múa. Đây là giống siêng hoa và dễ trồng.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (21,2,N'Rosomane Janon rose ',59000,39000,N'có đặc điểm cũng là một trong các loại hoa hồng bụi đẹp với sự kết hợp của đa màu sắc (vàng, cam, hồng). Loại hoa này có kích thước lớn có thể cao đến 1,5m, cánh đầy, hương thơm đặc trưng mùi trái cây tinh tế nhẹ nhàng.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (22,2,N'Hoa hồng Dames De Chennonceau',59000,39000,N'Hoa hồng leo Pháp được đánh giá là bông hồng có vẻ đẹp mộng mị màu cam hồng, form hoa nhiều cánh cúp mềm mại xếp chồng lên nhau, Và một điều tuyệt vời nhưng vô cùng độc đáo nữa đó chính là mùi hương nước hoa tuyệt đỉnh mà nó tỏa ra được ví như nước hoa dòng Eau De Parfum.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (23,2,N'Hoa Hồng Red Fairy',59000,39000,N'Nàng tiên đỏ có nguồn gốc từ Hoa Kỳ, cây thường có cỡ bông nhỏ kết thành từng chùm lớm đỏ rực, đường kính chỉ khoảng 2 – 3 cm, thuộc dạng cánh đơn với 20 – 30 cánh. Cây có khả năng phân nhánh tốt, thân cành có tán lá rậm rạp với rất nhiều gai nhỏ. Hầu như Red fairy không có mùi thơm nhưng bù lại rất phù hợp với khí hậu nóng. Vào mùa đông lạnh gần như nàng tiên đỏ sẽ ngủ đông (không ra hoa).',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (24,2,N'Hoa Hồng Bụi Grace rose',59000,39000,N'Cây rất sai hoa, dạng đơn và đặt biệt nụ hoa có hình trứng, khi nở sẽ có số lớp cánh dày xếp chồng lên trên hơn 76 cánh. Đây là một trong những giống hồng bụi đã giành chiến thắng trong giải Award of Garden Merit  của tác giả David Austin một cách xuất sắc.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (25,2,N'Hoa Hồng Bụi Cổ Sapa',59000,39000,N'Màu sắc của hoa không quá nhạt thếch cũng không quá loè lẹt, màu hồng cánh sen vừa đủ làm cho người ta ngắm mãi không thấy chán. Cùng với đó là thứ hương thơm mùi trà xanh nhẹ nhàng.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (26,2,N'Hoa Hồng Leo Huntington',59000,39000,N'Với nhiều lớp cánh hoa mềm mại tròn trịa xếp thành từng lớp gọn gàng khéo léo, cùng với hương thơm dịu ngọt thì nàng Huntington sẽ làm xao xuyến mọi con tim khi đứng gần.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (27,2,N'Hoa Hồng Leo Soeur Emmanuelle',59000,39000,N'Mang theo mình toàn bộ đặc tính của loài bông hồng Pháp, Soeur sở hữu một tông màu hồng cánh sen ngọt ngào, cánh hoa cứng cúp cáp ấn tượng và hiện đại không kém. Hồng leo Soeur Emmanuelle luôn tạo cảm giác mang lại nhiều năng lượng mỗi khi người khác ngắm nhìn nó.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (31,3,N'Tulip đỏ ',59000,39000,N'Tulip đỏ còn đại diện cho sự kiêu sa nhìn những cánh hoa đỏ thắm nổi bật làm người ta cứ ngỡ mình đang đứng trước một nữ hoàng khoác chiếc áo choàng nhung đỏ đầy vẻ kiều diễm và xinh đẹp. Trong tình yêu, nếu tặng Tulip đỏ cho người mình yêu thì có nghĩa bạn đã lạc vào tình yêu nồng cháy cùng người đó.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (32,3,N'Tulip trắng',59000,39000,N'Tulip trắng đại diện cho tình yêu thuần khiết, tinh khiết và danh dự, vì thế nó đã trở thành một món quà được nhiều người yêu quý dành cho một kỷ niệm, một cột mốc quan trọng trong tôn giáo như rửa tội... Có người lại nói hoa Tulip trắng như một chiếc chuông rơi từ trên thiên đường xuống làm bừng sáng cả một khu vườn.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (33,3,N'Tulip vàng ',59000,39000,N'Màu vàng là màu đại diện cho hạnh phúc, vui vẻ, may mắn và hy vọng, Tulip vàng tượng trưng cho sự rực rỡ và lời khen tặng dành cho người mình yêu: "Nụ cười của em tựa như ánh nắng mặt trời".',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (34,3,N'Tulip đen ',59000,39000,N'Tựa như nữ hoàng của bóng đêm, Tulip đen tượng trưng cho một tình yêu bất diệt, quyền lực và đầy bí ẩn. Sự say đắm và điên cuồng trong tình yêu của một người phụ nữ đã làm cảm động nhiều người ngay cả khi tình yêu ấy mất đi.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (35,3,N'Tulip đốm ',59000,39000,N'Nếu được tặng một đóa Tulip với những cánh hoa có màu có màu sắc lốm đốm thì chúc mừng bạn người tặng cho bạn đang khen rằng "Bạn sở hữu một đôi mắt tuyệt vời".',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (36,3,N'Tulip Cam ',59000,39000,N'Hoa tulip màu cam là loài hoa được ưa chuộng nhất hiện nay, nó tượng trưng cho sự ấm áp, hạnh phúc và thường được dùng để truyền cảm giác thấu hiểu, liên kết giữa hai người trong một mối quan hệ phức tạp. Sở hữu màu sắc của tràn đầy năng lượng nên hoa Tulip cam thể hiện cho sự đam mê, mong muốn và lòng nhiệt thành vô tận.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (37,3,N'Tulip Tím ',59000,39000,N'Hoa tulip màu tím thường được biết đến là biểu tượng của hoàng gia, đầy quyền lực, sang trọng. Không những vậy, nó còn đại diện cho sự lãng mạn, phấn khởi.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (38,3,N'Tulip Xanh ',59000,39000,N'Ý nghĩa hoa tulip xanh rất đặc biệt, nó là một trong những loài hoa duy nhất đại diện cho sự độc lập, độc đáo và đầy cá tính. Mặc dù đây không nằm trong bảng màu tự nhiên của hoa và được lai tạo từ các nhà thực vật tài ba. Vì thế, hoa tulip màu xanh được rất nhiều người mê hoa "săn lùng".',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (39,3,N'Tulip Kem ',59000,39000,N'Ngọt ngào và đầy cảm xúc khi bạn trao đi một đóa Tulip kem với lời hứa tình yêu bạn dành cho nửa kia của mình là mãi mãi, một lời chúc may mắn, đầy tốt đẹp dành cho người nhận, bởi hoa tulip màu kem là biểu tượng của sự may mắn, hạnh phúc viên mãn hay thể hiện sự quan tâm, chăm sóc đặc biệt.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (41,4,N'Hoa mẫu đơn đỏ',69000,49000,N'Loài hoa được coi là biểu tượng của sự may mắn, giàu sang nên mẫu đơn đỏ thường được chọn làm hoa mừng khai trương cho nhiều cửa hàng. Hoa có thông điệp như một lời chúc “phát tài phát lộc” bởi ngoài vẻ đẹp đằm thắm, hoa còn thể hiện được sự sang trọng, kiêu sa. Đồng thời, loài hoa này còn tượng trưng cho lòng chung thủy sắt son và một cuộc sống với hạnh phúc trọn vẹn. Thậm chí, truyền thuyết còn nói rằng nếu người con trai tặng hoa mẫu đơn đỏ cho cô gái mình yêu 999 ngày liên tiếp thì tình yêu sẽ đơm hoa và họ sẽ ở bên nhau hạnh phúc suốt đời.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (42,4,N'Hoa mẫu đơn tím',69000,49000,N'Hoa mẫu đơn tím có cánh rất mỏng manh nhưng lại vô cùng kiên cường trước gió bão. Chính vì thế, người ta ví loài hoa này như một người phụ nữ quyền lực, quyến rũ nhưng luôn ẩn giấu một nỗi buồn khó diễn tả. Bên cạnh đó, mẫu đơn tím còn rất thịnh hành tại châu Âu bởi được cho là sẽ mang lại niềm vui, may mắn và thành công cho gia chủ.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (43,4,N'Hoa mẫu đơn vàng',69000,49000,N'Không giống với mẫu đơn trắng nhẹ nhàng, thanh tao, hoa mẫu đơn vàng lại luôn rực rỡ, tươi sáng. Chính vì thế, mẫu đơn vàng được coi như là biểu trưng của tuổi thanh xuân nhiều đam mê, khát vọng, luôn muốn cháy hết mình và không bao giờ gục ngã trước những khó khăn, thử thách.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (44,4,N'Hoa mẫu đơn hồng',69000,49000,N'Có vẻ đẹp duyên dáng như một thiếu nữ mới lớn, hoa mẫu đơn hồng thường được dành để tặng cho những người con gái xinh đẹp và được yêu thương, trân trọng. Ngoài ra, mẫu đơn hồng còn là biểu tượng cho tình mẫu tử thiêng liêng và lòng bao dung của người mẹ, rằng dù qua bao thời gian thì tình mẹ dành cho con vẫn không hề vơi cạn.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (45,4,N'Hoa mẫu đơn trắng',69000,49000,N'Màu trắng của hoa mẫu đơn không chỉ tượng trưng cho sự tinh khôi, thanh khiết mà còn thể hiện được sự tinh tế, sang trọng của loài hoa. Chính vì thế, hoa mẫu đơn trắng có thể được xem như biểu tượng của một sự đẳng cấp riêng, đồng thời là niềm chân thành, hạnh phúc mà ai cũng mong có được.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (51,5,N'Hoa Baby',69000,49000,N'Bó hoa baby thường có kích thước nhỏ, chỉ từ 10 đến 20 cm, thích hợp để tặng trong các dịp như sinh nhật, kỷ niệm, lễ tình nhân hay để chúc mừng một sự kiện đặc biệt nào đó. Bó hoa này thường được cắt ngắn và sắp xếp trong một cách tinh tế để tạo ra một hình dạng đẹp mắt và ấn tượng. Bó hoa baby thường mang đến sự ngọt ngào và lãng mạn, và thường được coi là một biểu tượng cho tình yêu và sự chăm sóc. Với vẻ đẹp tinh tế và thanh lịch của nó, bó hoa baby chắc chắn sẽ là một món quà tuyệt vời cho bất kỳ ai yêu thích hoa và sự dịu dàng.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (52,5,N'Giỏ Hoa Baby',69000,49000,N'Giỏ hoa baby thường có kích thước từ nhỏ đến vừa, thích hợp để tặng trong các dịp như sinh nhật, kỷ niệm, lễ tình nhân hay để chúc mừng một sự kiện đặc biệt nào đó. Giỏ hoa này được thiết kế và bó hoa trong một giỏ bằng cỏ hoặc tre để tạo ra một hình dáng đẹp mắt và ấn tượng. Giỏ hoa baby thường mang đến sự ngọt ngào và lãng mạn, và thường được coi là một biểu tượng cho tình yêu và sự chăm sóc. Với vẻ đẹp tinh tế và thanh lịch của nó, giỏ hoa baby chắc chắn sẽ là một món quà tuyệt vời cho bất kỳ ai yêu thích hoa và sự dịu dàng. Bên cạnh đó, giỏ hoa baby cũng có thể được bổ sung bằng các phụ kiện như lưới hoặc ruy băng để tăng thêm tính thẩm mỹ và quý phái.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (53,5,N'Hoa baby 7 màu',69000,49000,N'Hoa baby 7 màu, hay còn gọi là hoa baby rainbow, là một loại hoa baby breath được sơn màu bằng chất phủ không độc hại để tạo ra một màu sắc đa dạng từ màu đỏ, cam, vàng, xanh lục, xanh dương, tím đến hồng. Các bông hoa baby breath được sơn màu tạo ra một hiệu ứng độc đáo và nổi bật, giúp tạo nên một bó hoa đầy màu sắc và sinh động. Hoa baby 7 màu thường được sử dụng để tạo nên những bó hoa tươi sáng và độc đáo, thích hợp để tặng trong các dịp kỷ niệm, sinh nhật hay để chúc mừng một sự kiện đặc biệt nào đó.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
		values (54,5,N'Hoa Cưới Baby',69000,49000,N': Hoa cưới baby thường là loại hoa baby breath, một loại hoa có tên gọi khác là Gypsophila, với những đặc tính như đầy màu sắc, tinh tế và đặc biệt là rất tinh khiết.vHoa cưới baby thường được sử dụng để tạo ra các bó hoa cưới sang trọng, thanh lịch và tươi sáng. Các bông hoa nhỏ của nó thường được sắp xếp theo những kiểu dáng khác nhau để tạo ra một thiết kế đầy ấn tượng và tinh tế. Hoa cưới baby thường được sử dụng để kết hợp với các loại hoa khác như hoa hồng, hoa cẩm chướng hay hoa thạch thảo để tạo ra một bó hoa cưới độc đáo và đẹp mắt',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (61,6,N'Cẩm tú cầu Incrediball',99000,69900,N'Incrediball – tên thương mại cho giống cây trồng ‘Abetwo’ của H. arborescens. Mặc dù những bông hoa khổng lồ, dày đặc 12 inch mà cây bụi tạo ra rất nhiều, nhưng thân cây cứng cáp của loài cây này sẽ không cho phép những bông hoa trên cây cẩm tú cầu trắng này rơi xuống bùn. Một chậu cây sẽ tạo nên một chiếc mỏ neo tuyệt đẹp trong khung cảnh mùa hè của bạn, hoặc bạn có thể trồng một vài chậu cây để làm hàng rào sặc sỡ.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (62,6,N'Cẩm tú cầu ‘Nikko Blue’ ',99000,69900,N'Giữ cho đất của bạn ở độ chua nếu bạn muốn đạt được những bông hoa màu xanh đậm nhất có thể từ bụi hoa cẩm tú cầu ‘Nikko Blue’ của bạn. Giống cây lau nhà này nở hoa sớm hơn hầu hết, thường bắt đầu vào tháng 6 và tồn tại trong hai tháng. Cung cấp biện pháp bảo vệ mùa đông trong khu vực khắc nghiệt 5 của USDA vì hoa được tạo ra từ các chồi hình thành trên thân cây của năm ngoái. Đây là một giống vi khuẩn H. macrophylla , còn được gọi là tú cầu lá lớn.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (63,6,N'Cẩm tú cầu Limelight',99000,69900,N'Những bông hoa xanh là những chiếc váy đen nhỏ của thế giới làm vườn: chúng phù hợp với mọi tình huống. Những bông hoa cẩm tú cầu ‘Limelight’ sẽ chuyển sang màu hồng dịu khi mùa chuyển sang. Cây nở hoa trên thân gỗ mới , khiến đây là một lựa chọn rất khó khăn ở những vùng lạnh giá. Mặc dù ‘Limelight’ là một giống cây trồng nhỏ gọn hơn một chút của H. paniculata , nó vẫn là loài sinh trưởng nhanh đã được biết đến với chiều cao 10 feet; trong không gian nhỏ hơn, hãy tìm người anh em họ nhỏ hơn của nó ‘Little Lime.’.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (64,6,N'Cẩm tú cầu Mars’ ',99000,69900,N'Loài cây bụi nhỏ gọn này là sự bổ sung hoàn hảo cho khu vườn ngoài sân của bạn. Giống như các giống Cẩm tú cầu khác, độ pH của đất ảnh hưởng đến màu sắc của hoa. Cẩm tú cầu ‘Mars’ ở đường thành phố có thể có nhiều màu trên cùng một bụi vào mùa sau khi lắp đặt khi cây điều chỉnh theo hóa chất đất độc đáo của bạn. Nếu nó được trồng trong một khu vườn có độ pH trung tính, nó sẽ có màu tím lơ lửng giữa màu xanh và hồng.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (65,6,N'Cẩm tú cầu Leo’ ',99000,69900,N'Bất cứ ai được thừa hưởng một mẫu hoa cẩm tú cầu leo đều là may mắn. Hoa cẩm tú cầu leo nổi tiếng là chậm phát triển. Tuy nhiên, một khi cây nho tự bám này được hình thành, nó có thể leo và vươn cao từ 40 feet trở lên tạo thành các hàng rào rất đẹp mắt. Hãy tìm loại hoa cẩm tú cầu leo nhiều màu ‘Miranda’ ( H. cuống lá nhỏ . Cuống lá ‘Miranda’), có viền lá màu vàng kem cùng với đầu hoa dài 10 inch.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (71,7,N'Hoa Cúc Bách Nhật',79000,69900,N'Hoa Bách Nhật là một loài hoa cúc khá đặc biệt. Ngay từ ý nghĩa tên gọi “Bách nhật” mang nghĩa là “trăm ngày”. Trăm ngày ngỡ là nhiều nhưng lại trôi qua thật nhanh, ngỡ là trôi nhanh nhưng lại chậm rãi từ từ. Cộng với việc, sắc hoa tím nổi bật, nên thơ đã khiến cho nhiều người mong muốn lựa chọn.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (72,7,N'Hoa Cúc Trắng',79000,69900,N'Hoa cúc trắng mang ý nghĩa sự thanh cao, vẻ đẹp đơn giản: Ý nghĩa này được dựa trên màu sắc mà loài hoa này sở hữu - màu trắng là biểu tượng cho sự giản dị, sạch sẽ và tinh khiết tuyệt đối, bởi vậy hoa cúc còn được coi là thể hiện cho một bậc chính nhân quân tử đúng nghĩa.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (73,7,N'Hoa Cúc Sao Băng',79000,69900,N'Hoa cúc sao băng không bao giờ làm người khác thất vọng với nét đẹp của “nàng thơ”. Mặc dù bông hoa nhỏ nhưng lại mang trong mình màu của nắng làm xua tan đi sự u ám. Nếu trồng hoa này thành thảm hoa thì bạn sẽ có ngay một dải ánh nắng trong sân nhà đấy.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (74,7,N'Hoa Cúc Chi',79000,69900,N'Hoa cúc chi cũng là loài hoa cúc rất được yêu thích và ưa chuộng hiện nay. Loài hoa mang sắc trắng tinh khôi, thuần khiết, có kích thước khá nhỏ. Các cây hoa cúc chi thường chỉ cao 0.5-1m, thân mềm, có lông trắng toàn thân. Hoa cúc chi có bông hoa nhỏ, các cánh hoa xếp chồng lên nhau bao xung quanh nhụy vàng.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (75,7,N'Hoa Cúc Anh ',79000,69900,N'Hoa Cúc Anh là loại cúc có nguồn gốc từ Châu Âu, khu vực Bắc Phi và Địa Trung Hải. Loại hoa có chiều cao thấp thường từ 14 – 17 cm nhưng hoa nở cực đẹp lung linh nên được rất nhiều người mua hạt giống hoa cúc anh về trồng và chăm sóc ngay tại nhà trong các chậu hoa.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (76,7,N'Hoa Cúc Châu Phi',79000,69900,N'Cúc Châu Phi là loại cúc mới xuất hiện tại Việt Nam trong những năm gần đây, và thật kỳ lạ ở Việt Nam cũng phát triển rất tốt, cho ra những bông hoa mảnh mai tuyệt đẹp. Không quá tráng lệ nhưng đầy sự tươi mới khỏe khắn.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (77,7,N'Hoa Cúc Chi hỗn hợp nhiều màu',79000,69900,N'Cúc Chi hỗn hợp nhiều màu là loại cúc phát triển từ cúc trắng nhằm mang đến cho người yêu hoa thêm sự lựa chọn. Cúc chi nhiều màu không quá nổi bật với vẻ bề ngoài nhưng lại mang một sức sống mãnh liệt, hoa có thời gian tàn lâu nhất, và ngay cả khi tàn thì hoa vẫn không bị rụng rơi.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (81,8,N'Hoa Lưu Ly Xanh',89000,79900,N'Tượng trưng cho những kỷ niệm tốt đẹp đã qua, nhưng không bao giờ bị lãng quên.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (82,8,N'Hoa Lưu Ly Hồng',89000,79900,N'Tượng trưng cho tình cảm, tình yêu đậm sâu của lứa đôi.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (83,8,N'Hoa Lưu Ly Trắng',89000,79900,N'Tượng trưng cho sự đơn giản, tinh tế, thanh cao, trong sáng.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (84,8,N'Hoa Lưu Ly Tím',89000,79900,N'Tượng trưng cho sự chung thủy của tình yêu, ngoài ra nó còn mang ý nghĩa cho sự thông cảm sâu sắc, lòng trắc ẩn của con người.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (85,8,N'Hoa Lưu Ly Xanh và Trắng',89000,79900,N'mang trong mình một sức sống vô cùng mãnh liệt. Mùi hương từ loài hoa này thoang thoảng, ấm áp như mùi hương của trái cây chín hay là mùi bánh ngọt thơm, béo ngậy làm cho người đối diện ngất ngây.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (86,8,N'Hoa Lưu Ly Xanh và Tím',89000,79900,N'Hoa lưu ly chính là biểu tượng của một loài hoa tình yêu thể hiện tấm lòng thuỷ chung, dù cách biệt âm dương, dù xa cách muôn trùng hay phong ba bão táp thì tình yêu đó vẫn tồn tại mãi.',7,1);
insert into SanPham(MaSP, MaNhom, TenSP, GiaSP, GiaKM, MoTa, SoLuong, TrangThai) 
	   values (87,8,N'Hoa Lưu Ly Xanh, Tím và Trắng',89000,79900,N'Hoa mang biểu tượng cho sự lãng mạn, sự thủy chung, tình thân gắn kết, tình bạn bền chặt và tình yêu nồng cháy, ngọt ngào. Hoa Lưu Ly còn mang ý nghĩa lòng trung thành, lòng dũng cảm và sự kiên định, trong các mối quan hệ bạn tặng họ những đóa hoa Lưu Ly sẽ làm gắn kết bền chặt mối quan hệ.',7,1);

----Them anh----
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(11, N'Hoa Sen Quan Âm Hồng', N'~\TemplateFiles\img\product\sen\sen_1');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(12, N'Sen mặt bằng Ba Vì', N'~\TemplateFiles\img\product\sen\sen_2');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(13, N'Super lotus', N'~\TemplateFiles\img\product\sen\sen_3');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(14, N'Sen Lucky Pink', N'~\TemplateFiles\img\product\sen\sen_4');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(15, N'SenDrop Blood', N'~\TemplateFiles\img\product\sen\sen_5');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(16, N'Golden Monekey', N'~\TemplateFiles\img\product\sen\sen_6');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(21, N'Rosomane Janon rose', N'~\TemplateFiles\img\product\hong\hong_1');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(22, N'Hoa hồng Dames De Chennonceau', N'~\TemplateFiles\img\product\hong\hong_2');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(23, N'Hoa Hồng Red Fairy', N'~\TemplateFiles\img\product\hong\hong_3');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(24, N'Hoa Hồng Bụi Grace rose', N'~\TemplateFiles\img\product\hong\hong_4');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(25, N'Hoa Hồng Bụi Cổ Sapa', N'~\TemplateFiles\img\product\hong\hong_5');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(26, N'Hoa Hồng Leo Huntington', N'~\TemplateFiles\img\product\hong\hong_6');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(27, N'Hoa Hồng Leo Soeur Emmanuelle', N'~\TemplateFiles\img\product\hong\hong_7');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(31, N'Tulip đỏ', N'~\TemplateFiles\img\product\tulip\tulip_1');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(32, N'Tulip trắng', N'~\TemplateFiles\img\product\tulip\tulip_2');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(33, N'Tulip vàng', N'~\TemplateFiles\img\product\tulip\tulip_3');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(34, N'Tulip đen', N'~\TemplateFiles\img\product\tulip\tulip_4');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(35, N'Tulip đốm', N'~\TemplateFiles\img\product\tulip\tulip_5');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(36, N'Tulip Cam', N'~\TemplateFiles\img\product\tulip\tulip_6');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(37, N'Tulip Tím', N'~\TemplateFiles\img\product\tulip\tulip_7');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(38, N'Tulip Xanh', N'~\TemplateFiles\img\product\tulip\tulip_8');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(39, N'Tulip Kem', N'~\TemplateFiles\img\product\tulip\tulip_9');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(41, N'Hoa mẫu đơn đỏ', N'~\TemplateFiles\img\product\maudon\maudon_1');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(42, N'Hoa mẫu đơn tím', N'~\TemplateFiles\img\product\maudon\maudon_2');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(43, N'Hoa mẫu đơn vàng', N'~\TemplateFiles\img\product\maudon\maudon_3');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(44, N'Hoa mẫu đơn hồng', N'~\TemplateFiles\img\product\maudon\maudon_4');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(45, N'Hoa mẫu đơn trắng', N'~\TemplateFiles\img\product\maudon\maudon_5');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(51, N'Hoa Baby', N'~\TemplateFiles\img\product\baby\baby_1');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(52, N'Giỏ Hoa Baby', N'~\TemplateFiles\img\product\baby\baby_2');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(53, N'Hoa baby 7 màu', N'~\TemplateFiles\img\product\baby\baby_3');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(54, N'Hoa Cưới Baby', N'~\TemplateFiles\img\product\baby\baby_4');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(61, N'Cẩm tú cầu Incrediball', N'~\TemplateFiles\img\product\camtu\camtu_1');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(62, N'Cẩm tú cầu ‘Nikko Blue’ ', N'~\TemplateFiles\img\product\camtu\camtu_2');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(63, N'Cẩm tú cầu Limelight’ ', N'~\TemplateFiles\img\product\camtu\camtu_3');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(64, N'Cẩm tú cầu Mars’ ', N'~\TemplateFiles\img\product\camtu\camtu_4');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(65, N'Cẩm tú cầu Leo’ ', N'~\TemplateFiles\img\product\camtu\camtu_5');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(71, N'Hoa Cúc Bách Nhật', N'~\TemplateFiles\img\product\cuc\cuc_4');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(72, N'Hoa Cúc Trắng', N'~\TemplateFiles\img\product\cuc\cuc_1');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(73,N'Hoa Cúc Sao Băng', N'~\TemplateFiles\img\product\cuc\cuc_3');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(74,N'Hoa Cúc Chi', N'~\TemplateFiles\img\product\cuc\cuc_2');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(75,N'Hoa Cúc Anh', N'~\TemplateFiles\img\product\cuc\cuc_5');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(76,N'Hoa Cúc Châu Phi', N'~\TemplateFiles\img\product\cuc\cuc_7');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(77,N'Hoa Cúc Chi hỗn hợp nhiều màu', N'~\TemplateFiles\img\product\cuc\cuc_6');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(81, N'Hoa Lưu Ly Xanh', N'~\TemplateFiles\img\product\luuly\luuly_4');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(82, N'Hoa Lưu Ly Hông', N'~\TemplateFiles\img\product\luuly\luuly_2');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(83, N'Hoa Lưu Ly Trắng', N'~\TemplateFiles\img\product\luuly\luuly_5');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(84, N'Hoa Lưu Ly Tím', N'~\TemplateFiles\img\product\luuly\luuly_6');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(85, N'Hoa Lưu Ly Xanh và Trắng', N'~\TemplateFiles\img\product\luuly\luuly_7');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(86, N'Hoa Lưu Ly Xanh và Tím', N'~\TemplateFiles\img\product\luuly\luuly_1');
insert into AnhSP(MaSP, TenAnh, DuongDan)
		values(87, N'Hoa Lưu Ly Xanh, Tím và trắng', N'~\TemplateFiles\img\product\luuly\luuly_3');

