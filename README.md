# csn-da23tta-nguyenbuithieugia-thietkehethong
/*==============================================================*/
/* DBMS name:      SAP SQL Anywhere 17                          */
/* Created on:     19/12/2025 1:44:55 CH                        */
/*==============================================================*/

DROP DATABASE CSN

CREATE DATABASE CSN
GO
USE CSN
GO

if exists (select 1 from sys.foreign_keys where name = 'FK_HOCSINH_HOCSINH_K_KQHOCTAP')
   alter table HOCSINH drop constraint FK_HOCSINH_HOCSINH_K_KQHOCTAP;

if exists (select 1 from sys.foreign_keys where name = 'FK_HOCSINH__HOCSINH_G_HOCSINH')
   alter table HOCSINH_GOIY drop constraint FK_HOCSINH__HOCSINH_G_HOCSINH;

if exists (select 1 from sys.foreign_keys where name = 'FK_HOCSINH__HOCSINH_G_GOIY')
   alter table HOCSINH_GOIY drop constraint FK_HOCSINH__HOCSINH_G_GOIY;

if exists (select 1 from sys.foreign_keys where name = 'FK_NGANH_KH_NGANH_KHO_NGANHXET')
   alter table NGANH_KHOIXETTUYEN drop constraint FK_NGANH_KH_NGANH_KHO_NGANHXET;

if exists (select 1 from sys.foreign_keys where name = 'FK_NGANH_KH_NGANH_KHO_KHOIXETT')
   alter table NGANH_KHOIXETTUYEN drop constraint FK_NGANH_KH_NGANH_KHO_KHOIXETT;

if exists (select 1 from sys.foreign_keys where name = 'FK_TRUONGDH_TRUONGDH__TRUONGDA')
   alter table TRUONGDH_NGANHXT drop constraint FK_TRUONGDH_TRUONGDH__TRUONGDA;

if exists (select 1 from sys.foreign_keys where name = 'FK_TRUONGDH_TRUONGDH__NGANHXET')
   alter table TRUONGDH_NGANHXT drop constraint FK_TRUONGDH_TRUONGDH__NGANHXET;

if exists (select 1 from sys.foreign_keys where name = 'FK_TRUONGDH_TRUONGDH__GOIY')
   alter table TRUONGDH_NGANHXT drop constraint FK_TRUONGDH_TRUONGDH__GOIY;


drop table if exists GOIY;
drop table if exists HOCSINH;
drop table if exists HOCSINH_GOIY;
drop table if exists KHOIXETTUYEN;
drop table if exists KQHOCTAP;
drop table if exists NGANHXETTUYEN;
drop table if exists NGANH_KHOIXETTUYEN;
drop table if exists TRUONGDAIHOC;
drop table if exists TRUONGDH_NGANHXT;


create table GOIY (
   MAGOIY varchar(10) not null,
   LYDOGOIY NVARCHAR(max) null,
   constraint PK_GOIY primary key (MAGOIY)
);
insert into GOIY (MAGOIY, LYDOGOIY) values
('G01', N'Nên chọn ngành phù hợp sở thích'),
('G02', N'Điểm chuẩn năm trước cao'),
('G03', N'Trường có uy tín lâu năm'),
('G04', N'Ngành có nhiều cơ hội việc làm'),
('G05', N'Phù hợp năng lực học sinh'),
('G06', N'Ngành hot hiện nay'),
('G07', N'Có học bổng hỗ trợ'),
('G08', N'Ngành dễ xin việc'),
('G09', N'Trường gần nhà'),
('G10', N'Ngành phù hợp xu hướng công nghệ'),
('G11', N'Ngành cần nhân lực cao'),
('G12', N'Ngành có thu nhập tốt'),
('G13', N'Ngành phù hợp tính cách'),
('G14', N'Ngành có cơ hội du học'),
('G15', N'Ngành có nhiều chương trình liên kết'),
('G16', N'Ngành phù hợp sức khỏe'),
('G17', N'Ngành có môi trường học tập tốt'),
('G18', N'Ngành có nhiều hoạt động ngoại khóa'),
('G19', N'Ngành có cơ hội thăng tiến'),
('G20', N'Ngành phù hợp định hướng gia đình');

SELECT * FROM GOIY;

create table HOCSINH (
   MAHS varchar(10) not null,
   MAKQ varchar(10) not null,
   HOTEN nvarchar(30) null,
   NGAYSINH date null,
   DIACHI nvarchar(30) null,
   SDT varchar(15) null,
   constraint PK_HOCSINH primary key (MAHS)
);

insert into HOCSINH (MAHS, MAKQ, HOTEN, NGAYSINH, DIACHI, SDT) values
('HS01', 'KQ01', N'Nguyễn Văn Tùng', '2007-05-12', N'Vĩnh Long', '0915733409'),
('HS02', 'KQ02', N'Trần Thị Bình', '2007-08-20', N'Cần Thơ', '0987307762'),
('HS03', 'KQ03', N'Lê Văn Cảnh', '2007-12-01', N'Tiền Giang', '0378443613'),
('HS04', 'KQ04', N'Phạm Thị Vân Anh', '2007-03-15', N'Đồng Tháp', '0973237615'),
('HS05', 'KQ05', N'Võ Phan Nhật Tài', '2007-07-22', N'An Giang', '0358921102'),
('HS06', 'KQ06', N'Nguyễn Thị Ngọc Ánh', '2007-09-10', N'Hậu Giang', '0933468752'),
('HS07', 'KQ07', N'Trần Lê Hồng Nhung', '2007-11-05', N'Sóc Trăng', '0946721058'),
('HS08', 'KQ08', N'Lâm Khả Vy', '2007-01-25', N'Bạc Liêu', '0954321195'),
('HS09', 'KQ09', N'Nguyễn Tấn Tài', '2007-10-30', N'Cà Mau', '0311078262'),
('HS10', 'KQ10', N'Phạm Thị Tuyết Vân', '2007-04-18', N'Kiên Giang', '0978516394'),
('HS11', 'KQ11', N'Võ Văn Huy', '2007-06-12', N'Trà Vinh', '0986710237'),
('HS12', 'KQ12', N'Nguyễn Thị Ngọc Mai', '2007-08-08', N'Bến Tre', '0996017783'),
('HS13', 'KQ13', N'Lý Kim Yến', '2007-09-09', N'Long An', '0910351892'),
('HS14', 'KQ14', N'Lâm Nguyễn Yến Nhi', '2007-02-02', N'Tiền Giang', '0921791234'),
('HS15', 'KQ15', N'Nguyễn Nhật Hùng ', '2007-05-05', N'Vĩnh Long', '0932337856'),
('HS16', 'KQ16', N'Trần Phan Vân Anh', '2007-07-07', N'Cần Thơ', '0943572319'),
('HS17', 'KQ17', N'Lê Văn Qúy', '2007-12-12', N'Đồng Tháp', '0954732466'),
('HS18', 'KQ18', N'Phạm Ngọc Tuyền', '2007-03-03', N'An Giang', '0965676789'),
('HS19', 'KQ19', N'Võ Văn Cường', '2007-11-11', N'Hậu Giang', '0976780151'),
('HS20', 'KQ20', N'Nguyễn Thị Anh Thy', '2007-09-09', N'Sóc Trăng', '0987812309');

SELECT * FROM HOCSINH;


create table HOCSINH_GOIY (
   MAHS varchar(10) not null,
   MAGOIY varchar(10) not null,
   constraint PK_HOCSINH_GOIY primary key (MAHS, MAGOIY)
);
insert into HOCSINH_GOIY (MAHS, MAGOIY) values
('HS01','G01'),
('HS02','G02'),
('HS03','G03'),
('HS04','G04'),
('HS05','G05'),
('HS06','G06'),
('HS07','G07'),
('HS08','G08'),
('HS09','G09'),
('HS10','G10'),
('HS11','G11'),
('HS12','G12'),
('HS13','G13'),
('HS14','G14'),
('HS15','G15'),
('HS16','G16'),
('HS17','G17'),
('HS18','G18'),
('HS19','G19'),
('HS20','G20');

SELECT *FROM HOCSINH_GOIY;

create table KHOIXETTUYEN (
   MAKHOI varchar(10) not null,
   TENKHOI nvarchar(20) null,
   constraint PK_KHOIXETTUYEN primary key (MAKHOI)
);
insert into KHOIXETTUYEN (MAKHOI, TENKHOI) values
('A00',N'Toán-Lý-Hóa'),
('A01',N'Toán-Lý-Anh'),
('A02',N'Toán-Lý-Sinh'),
('B00',N'Toán-Hóa-Sinh'),
('C00',N'Văn-Sử-Địa'),
('C01',N'Văn-Toán-Lý'),
('C02',N'Văn-Toán-Hóa'),
('D01',N'Toán-Văn-Anh'),
('D07',N'Toán-Hóa-Anh'),
('D08',N'Toán-Sinh-Anh'),
('D09',N'Toán-Địa-Anh'),
('D10',N'Toán-Sử-Anh'),
('D11',N'Văn-Lý-Anh'),
('D12',N'Văn-Hóa-Anh'),
('D13',N'Văn-Sinh-Anh'),
('D14',N'Văn-Địa-Anh'),
('D15',N'Văn-Sử-Anh'),
('D90',N'Toán-KHTN-Anh'),
('D96',N'Toán-KHXH-Anh'),
('D99',N'Toán-Văn-KHTN');

SELECT * FROM KHOIXETTUYEN;

create table KQHOCTAP (
   MAKQ varchar(10) not null,
   DIEMTOAN float null,
   DIEMANH float null,
   DIEMVAN float null,
   MONTUCHON float null,
   NAMHOC varchar(10) null,
   constraint PK_KQHOCTAP primary key (MAKQ)
);
insert into KQHOCTAP (MAKQ, DIEMTOAN, DIEMANH, DIEMVAN, MONTUCHON, NAMHOC) values
('KQ01', 8.5, 7.0, 6.5, 8.0, '2025'),
('KQ02', 9.0, 8.5, 7.5, 9.0, '2025'),
('KQ03', 6.0, 6.5, 7.0, 6.5, '2025'),
('KQ04', 7.5, 8.0, 7.0, 7.5, '2025'),
('KQ05', 8.0, 7.5, 8.0, 8.5, '2025'),
('KQ06', 9.2, 8.8, 7.9, 9.0, '2025'),
('KQ07', 7.0, 6.5, 7.5, 7.0, '2025'),
('KQ08', 8.7, 8.2, 7.8, 8.5, '2025'),
('KQ09', 6.8, 7.0, 6.5, 7.0, '2025'),
('KQ10', 9.5, 9.0, 8.5, 9.2, '2025'),
('KQ11', 7.8, 7.5, 7.0, 7.5, '2025'),
('KQ12', 8.3, 8.0, 7.5, 8.0, '2025'),
('KQ13', 6.5, 6.0, 6.8, 6.5, '2025'),
('KQ14', 7.2, 7.0, 7.5, 7.0, '2025'),
('KQ15', 8.9, 8.5, 8.0, 9.0, '2025'),
('KQ16', 9.1, 9.0, 8.7, 9.2, '2025'),
('KQ17', 7.0, 7.2, 7.5, 7.0, '2025'),
('KQ18', 8.4, 8.0, 7.8, 8.5, '2025'),
('KQ19', 6.9, 7.0, 6.5, 7.0, '2025'),
('KQ20', 9.3, 9.0, 8.8, 9.2, '2025');

SELECT * FROM KQHOCTAP;

create table NGANHXETTUYEN (
   MANGHANH varchar(10) not null,
   TENNGANH nvarchar(20) null,
   MOTA nvarchar(max) null,
   constraint PK_NGANHXETTUYEN primary key (MANGHANH)
);
INSERT INTO NGANHXETTUYEN (MANGHANH, TENNGANH, MOTA) VALUES
('7480201', N'Công nghệ thông tin', N'Đào tạo kỹ sư/cử nhân CNTT: lập trình, hệ thống, trí tuệ nhân tạo'),
('7720101', N'Y khoa', N'Đào tạo bác sĩ đa khoa và các chuyên ngành y tế'),
('7310101', N'Kinh tế', N'Đào tạo cử nhân kinh tế, quản lý, tài chính'),
('7520207', N'Kỹ thuật điện tử', N'Đào tạo kỹ sư điện tử, truyền thông, mạng'),
('7380101', N'Luật', N'Đào tạo cử nhân luật, luật sư, pháp chế'),
('7580201', N'Kỹ thuật xây dựng', N'Đào tạo kỹ sư xây dựng dân dụng và công nghiệp'),
('7220201', N'Ngôn ngữ Anh', N'Đào tạo cử nhân ngôn ngữ, biên - phiên dịch, giảng dạy'),
('7720201', N'Dược học', N'Đào tạo dược sĩ, nghiên cứu và sản xuất thuốc'),
('7140201', N'Giáo dục tiểu học', N'Đào tạo giáo viên tiểu học'),
('7340101', N'Quản trị kinh doanh', N'Đào tạo quản lý doanh nghiệp, khởi nghiệp'),
('7340201', N'Tài chính Ngân hàng', N'Đào tạo chuyên ngành tài chính, ngân hàng, đầu tư'),
('7340301', N'Kế toán', N'Đào tạo kế toán, kiểm toán, quản lý tài chính'),
('7580101', N'Kiến trúc', N'Đào tạo kiến trúc sư, thiết kế công trình'),
('7520103', N'Kỹ thuật cơ khí', N'Đào tạo kỹ sư cơ khí, chế tạo máy'),
('7480101', N'Khoa học máy tính', N'Đào tạo chuyên sâu về thuật toán, trí tuệ nhân tạo'),
('7340115', N'Marketing', N'Đào tạo chuyên ngành tiếp thị, truyền thông, thương hiệu'),
('7310206', N'Quan hệ quốc tế', N'Đào tạo chuyên ngành quan hệ quốc tế, ngoại giao'),
('7220204', N'Ngôn ngữ Trung Quốc', N'Đào tạo cử nhân ngôn ngữ, biên - phiên dịch tiếng Trung'),
('7220209', N'Ngôn ngữ Nhật', N'Đào tạo cử nhân ngôn ngữ, biên - phiên dịch tiếng Nhật'),
('7440301', N'Khoa học môi trường', N'Đào tạo chuyên ngành môi trường, phát triển bền vững');
SELECT * FROM NGANHXETTUYEN;


create table NGANH_KHOIXETTUYEN (
   MANGHANH varchar(10) not null,
   MAKHOI varchar(10) not null,
   constraint PK_NGANH_KHOIXETTUYEN primary key (MANGHANH, MAKHOI)
);
INSERT INTO NGANH_KHOIXETTUYEN (MANGHANH, MAKHOI) VALUES
('7480201','A00'), -- Công nghệ thông tin
('7480201','A01'),
('7480201','D01'),

('7720101','B00'), -- Y khoa
('7720101','D08'),
('7720101','D13'),

('7310101','C00'), -- Kinh tế
('7310101','D01'),
('7310101','D14'),

('7520207','A00'), -- Kỹ thuật điện tử - viễn thông
('7520207','A01'),

('7380101','C00'), -- Luật
('7380101','D01'),

('7580201','A00'), -- Kỹ thuật xây dựng
('7580201','A02'),

('7220201','D01'), -- Ngôn ngữ Anh
('7220201','D15'),

('7720201','B00'), -- Dược học
('7720201','D07'),

('7140201','C00'); -- Sư phạm

SELECT *FROM NGANH_KHOIXETTUYEN;

create table TRUONGDAIHOC (
   MATRUONGDH varchar(10) not null,
   TENTRUONGDH nvarchar(30) null,
   DIACHITRUONG nvarchar(100) null,
   WEBSITE nvarchar(50) null,
   SDTTRUONG varchar(15) null,
   EMAIL nvarchar(50) null,
   constraint PK_TRUONGDAIHOC primary key (MATRUONGDH)
);
INSERT INTO TRUONGDAIHOC (MATRUONGDH, TENTRUONGDH, DIACHITRUONG, WEBSITE, SDTTRUONG, EMAIL) VALUES
('BKA', N'ĐH Bách Khoa Hà Nội', N'Quận Hai Bà Trưng, Hà Nội', 'https://www.hust.edu.vn', '02438693869', 'contact@hust.edu.vn'),
('QSB', N'ĐH Bách Khoa TP.HCM', N'Quận 10, TP.HCM', 'https://www.hcmut.edu.vn', '02838647256', 'info@hcmut.edu.vn'),
('QHQ', N'ĐH Quốc Gia Hà Nội', N'Quận Cầu Giấy, Hà Nội', 'https://www.vnu.edu.vn', '02437547670', 'admission@vnu.edu.vn'),
('QGS', N'ĐH Quốc Gia TP.HCM', N'TP Thủ Đức, TP.HCM', 'https://www.vnuhcm.edu.vn', '02837242160', 'info@vnuhcm.edu.vn'),
('YHB', N'ĐH Y Hà Nội', N'Quận Đống Đa, Hà Nội', 'https://www.hmu.edu.vn', '02438523798', 'contact@hmu.edu.vn'),
('YDS', N'ĐH Y Dược TP.HCM', N'Quận 5, TP.HCM', 'https://www.ump.edu.vn', '02838554269', 'info@ump.edu.vn'),
('KHA', N'ĐH Kinh tế Quốc dân', N'Quận Hai Bà Trưng, Hà Nội', 'https://www.neu.edu.vn', '02436280280', 'admission@neu.edu.vn'),
('UEH', N'ĐH Kinh tế TP.HCM', N'Quận 3, TP.HCM', 'https://www.ueh.edu.vn', '02838295464', 'info@ueh.edu.vn'),
('LNH', N'ĐH Luật Hà Nội', N'Quận Đống Đa, Hà Nội', 'https://www.hlu.edu.vn', '02437562345', 'contact@hlu.edu.vn'),
('LPS', N'ĐH Luật TP.HCM', N'Quận 4, TP.HCM', 'https://www.hcmulaw.edu.vn', '02839300000', 'info@hcmulaw.edu.vn'),
('XDA', N'ĐH Xây dựng Hà Nội', N'Quận Hai Bà Trưng, Hà Nội', 'https://www.nuce.edu.vn', '02438612345', 'contact@nuce.edu.vn'),
('KTA', N'ĐH Kiến trúc TP.HCM', N'Quận 3, TP.HCM', 'https://www.uah.edu.vn', '02838962211', 'info@uah.edu.vn'),
('ULIS', N'ĐH Ngoại ngữ – ĐHQGHN', N'Quận Cầu Giấy, Hà Nội', 'https://ulis.vnu.edu.vn', '02437547269', 'admission@ulis.edu.vn'),
('SPH', N'ĐH Sư phạm Hà Nội', N'Quận Cầu Giấy, Hà Nội', 'https://www.hnue.edu.vn', '02438544498', 'info@hnue.edu.vn'),
('SPS', N'ĐH Sư phạm TP.HCM', N'Quận 5, TP.HCM', 'https://www.hcmue.edu.vn', '02838352020', 'contact@hcmue.edu.vn'),
('DPH', N'ĐH Dược Hà Nội', N'Quận Hoàn Kiếm, Hà Nội', 'https://www.hup.edu.vn', '02439331945', 'info@hup.edu.vn'),
('NTH', N'ĐH Ngoại thương (Hà Nội)', N'Quận Đống Đa, Hà Nội', 'https://www.ftu.edu.vn', '02432595100', 'admission@ftu.edu.vn'),
('NTS', N'ĐH Ngoại thương (TP.HCM)', N'Quận Bình Thạnh, TP.HCM', 'https://www.ftu.edu.vn', '02838247279', 'info@ftu.edu.vn'),
('CNH', N'ĐH Công nghiệp Hà Nội', N'Quận Bắc Từ Liêm, Hà Nội', 'https://www.haui.edu.vn', '02437655121', 'contact@haui.edu.vn'),
('IUH', N'ĐH Công nghiệp TP.HCM', N'Quận Gò Vấp, TP.HCM', 'https://www.iuh.edu.vn', '02838940390', 'info@iuh.edu.vn');

DELETE FROM TRUONGDAIHOC WHERE MATRUONGDH = 'BKA';
SELECT * FROM TRUONGDAIHOC;

DELETE TRUONGDAIHOC;

create table TRUONGDH_NGANHXT (
   MATRUONGDH varchar(10) not null,
   MANGHANH varchar(10) not null,
   MAGOIY varchar(10) not null,
   NAMTUYENSINH date null,
   CHITIEUTS int null,
   DIEMCHUAN float null,
   constraint PK_TRUONGDH_NGANHXT primary key (MATRUONGDH, MANGHANH, MAGOIY)
);
INSERT INTO TRUONGDH_NGANHXT (MATRUONGDH, MANGHANH, MAGOIY, NAMTUYENSINH, CHITIEUTS, DIEMCHUAN)
VALUES
('BKA','7480201','G01','2025-08-20',1200,25.5), -- ĐH Bách Khoa Hà Nội - Công nghệ thông tin
('BKA','7520207','G02','2025-08-20',800,24.0),  -- ĐH Bách Khoa Hà Nội - Kỹ thuật điện tử - viễn thông
('QSB','7480201','G03','2025-08-20',1000,26.0), -- ĐH Bách Khoa TP.HCM - Công nghệ thông tin
('QSB','7520103','G04','2025-08-20',700,23.5),  -- ĐH Bách Khoa TP.HCM - Kỹ thuật cơ khí
('KHA','7340101','G05','2025-08-20',1000,25.0), -- ĐH Kinh tế Quốc dân - Quản trị kinh doanh
('KHA','7340201','G06','2025-08-20',800,24.5),  -- ĐH Kinh tế Quốc dân - Tài chính - Ngân hàng
('UEH','7340101','G07','2025-08-20',950,24.0),  -- ĐH Kinh tế TP.HCM - Quản trị kinh doanh
('UEH','7340301','G08','2025-08-20',850,23.5),  -- ĐH Kinh tế TP.HCM - Kế toán
('NTH','7310101','G09','2025-08-20',900,26.5),  -- ĐH Ngoại thương HN - Kinh tế
('NTH','7220201','G10','2025-08-20',700,25.0),  -- ĐH Ngoại thương HN - Ngôn ngữ Anh
('YHB','7720101','G11','2025-08-20',600,27.5),  -- ĐH Y Hà Nội - Y khoa
('YHB','7720201','G12','2025-08-20',400,26.0),  -- ĐH Y Hà Nội - Dược học
('YDS','7720101','G13','2025-08-20',500,27.0),  -- ĐH Y Dược TP.HCM - Y khoa
('YDS','7720201','G14','2025-08-20',400,26.0),  -- ĐH Y Dược TP.HCM - Dược học
('HTC','7340201','G15','2025-08-20',800,24.5),  -- Học viện Tài chính - Tài chính - Ngân hàng
('NHH','7340301','G16','2025-08-20',700,23.5),  -- Học viện Ngân hàng - Kế toán
('SPH','7140209','G17','2025-08-20',650,23.0),  -- ĐH Sư phạm Hà Nội - Sư phạm Toán
('SPS','7140217','G18','2025-08-20',600,22.5),  -- ĐH Sư phạm TP.HCM - Sư phạm Ngữ văn
('KTA','7580101','G19','2025-08-20',750,24.5),  -- ĐH Kiến trúc TP.HCM - Kiến trúc
('ULIS','7220201','G20','2025-08-20',600,25.0); -- ĐH Ngoại ngữ – ĐHQGHN - Ngôn ngữ Anh

SELECT * FROM TRUONGDH_NGANHXT;
alter table HOCSINH
   add constraint FK_HOCSINH_HOCSINH_K_KQHOCTAP foreign key (MAKQ)
      references KQHOCTAP (MAKQ);

alter table HOCSINH_GOIY
   add constraint FK_HOCSINH__HOCSINH_G_HOCSINH foreign key (MAHS)
      references HOCSINH (MAHS);

alter table HOCSINH_GOIY
   add constraint FK_HOCSINH__HOCSINH_G_GOIY foreign key (MAGOIY)
      references GOIY (MAGOIY);

alter table NGANH_KHOIXETTUYEN
   add constraint FK_NGANH_KH_NGANH_KHO_NGANHXET foreign key (MANGHANH)
      references NGANHXETTUYEN (MANGHANH);

alter table NGANH_KHOIXETTUYEN
   add constraint FK_NGANH_KH_NGANH_KHO_KHOIXETT foreign key (MAKHOI)
      references KHOIXETTUYEN (MAKHOI);

alter table TRUONGDH_NGANHXT
   add constraint FK_TRUONGDH_TRUONGDH__TRUONGDA foreign key (MATRUONGDH)
      references TRUONGDAIHOC (MATRUONGDH);

alter table TRUONGDH_NGANHXT
   add constraint FK_TRUONGDH_TRUONGDH__NGANHXET foreign key (MANGHANH)
      references NGANHXETTUYEN (MANGHANH);

alter table TRUONGDH_NGANHXT
   add constraint FK_TRUONGDH_TRUONGDH__GOIY foreign key (MAGOIY)
      references GOIY (MAGOIY);

      --Truy van
      --Truy van diem cua hsinh
      select 
    hs.MAHS,
    hs.HOTEN,
    kq.DIEMTOAN,
    kq.DIEMANH,
    kq.DIEMVAN,
    kq.MONTUCHON,
    kq.NAMHOC
from HOCSINH hs
join KQHOCTAP kq on hs.MAKQ = kq.MAKQ
order by hs.MAHS;
--Diem trung binh 

 select hs.MAHS, hs.HOTEN,
       (kq.DIEMTOAN + kq.DIEMANH + kq.DIEMVAN + kq.MONTUCHON)/4 as DiemTB
from HOCSINH hs
join KQHOCTAP kq on hs.MAKQ = kq.MAKQ;

select n.TENNGANH, k.TENKHOI
from NGANHXETTUYEN n
join NGANH_KHOIXETTUYEN nk on n.MANGHANH = nk.MANGHANH
join KHOIXETTUYEN k on nk.MAKHOI = k.MAKHOI;


--top 5hs diem cao nhat
select top 5 hs.HOTEN,
       (kq.DIEMTOAN + kq.DIEMANH + kq.DIEMVAN + kq.MONTUCHON)/4 as DiemTB
from HOCSINH hs
join KQHOCTAP kq on hs.MAKQ = kq.MAKQ
order by DiemTB desc;
--
select hs.HOTEN, g.LYDOGOIY, t.TENTRUONGDH, n.TENNGANH
from HOCSINH hs
join HOCSINH_GOIY hg on hs.MAHS = hg.MAHS
join GOIY g on hg.MAGOIY = g.MAGOIY
join TRUONGDH_NGANHXT xt on g.MAGOIY = xt.MAGOIY
join TRUONGDAIHOC t on xt.MATRUONGDH = t.MATRUONGDH
join NGANHXETTUYEN n on xt.MANGHANH = n.MANGHANH;

SELECT * FROM TRUONGDAIHOC;
SELECT *FROM TRUONGDH_NGANHXT;

SELECT 
    hs.MAHS,
    hs.HOTEN,
   (kq.DIEMTOAN + kq.DIEMANH + kq.DIEMVAN + kq.MONTUCHON)/4 AS DTB,
    t.TENTRUONGDH,
    n.TENNGANH,
    xt.DIEMCHUAN
FROM HOCSINH hs
JOIN KQHOCTAP kq ON hs.MAKQ = kq.MAKQ
JOIN TRUONGDH_NGANHXT xt ON xt.NAMTUYENSINH = '2025-08-20'
JOIN TRUONGDAIHOC t ON xt.MATRUONGDH = t.MATRUONGDH
JOIN NGANHXETTUYEN n ON xt.MANGHANH = n.MANGHANH
WHERE xt.DIEMCHUAN in
(
select (kq.DIEMTOAN + kq.DIEMANH + kq.DIEMVAN)
from KQHOCTAP kq
)

select * from TRUONGDH_NGANHXT xt
where xt.NAMTUYENSINH='2025-08-20'


select t.TENTRUONGDH, n.TENNGANH, xt.DIEMCHUAN
from TRUONGDAIHOC t
join TRUONGDH_NGANHXT xt on t.MATRUONGDH = xt.MATRUONGDH
join NGANHXETTUYEN n on xt.MANGHANH = n.MANGHANH;


select hs.HOTEN, g.LYDOGOIY, t.TENTRUONGDH, n.TENNGANH
from HOCSINH hs
join HOCSINH_GOIY hg on hs.MAHS = hg.MAHS
join GOIY g on hg.MAGOIY = g.MAGOIY
join TRUONGDH_NGANHXT xt on g.MAGOIY = xt.MAGOIY
join TRUONGDAIHOC t on xt.MATRUONGDH = t.MATRUONGDH
join NGANHXETTUYEN n on xt.MANGHANH = n.MANGHANH;
