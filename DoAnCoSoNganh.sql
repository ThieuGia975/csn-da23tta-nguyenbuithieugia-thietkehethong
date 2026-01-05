/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     02/01/2026 4:30:20 CH                        */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_HOCSINH_HOCSINH_K_KQHOCTAP') then
    alter table HOCSINH
       delete foreign key FK_HOCSINH_HOCSINH_K_KQHOCTAP
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HOCSINH__HOCSINH_G_HOCSINH') then
    alter table HOCSINH_GOIY
       delete foreign key FK_HOCSINH__HOCSINH_G_HOCSINH
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HOCSINH__HOCSINH_G_GOIY') then
    alter table HOCSINH_GOIY
       delete foreign key FK_HOCSINH__HOCSINH_G_GOIY
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_NGANH_KH_NGANH_KHO_NGANHXET') then
    alter table NGANH_KHOIXETTUYEN
       delete foreign key FK_NGANH_KH_NGANH_KHO_NGANHXET
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_NGANH_KH_NGANH_KHO_KHOIXETT') then
    alter table NGANH_KHOIXETTUYEN
       delete foreign key FK_NGANH_KH_NGANH_KHO_KHOIXETT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TRUONGDH_TRUONGDH__TRUONGDA') then
    alter table TRUONGDH_NGANHXT
       delete foreign key FK_TRUONGDH_TRUONGDH__TRUONGDA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TRUONGDH_TRUONGDH__NGANHXET') then
    alter table TRUONGDH_NGANHXT
       delete foreign key FK_TRUONGDH_TRUONGDH__NGANHXET
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TRUONGDH_TRUONGDH__GOIY') then
    alter table TRUONGDH_NGANHXT
       delete foreign key FK_TRUONGDH_TRUONGDH__GOIY
end if;

drop index if exists GOIY.GOIY_PK;

drop table if exists GOIY;

drop index if exists HOCSINH.HOCSINH_KETQUA_FK;

drop index if exists HOCSINH.HOCSINH_PK;

drop table if exists HOCSINH;

drop index if exists HOCSINH_GOIY.HOCSINH_GOIY_PK;

drop table if exists HOCSINH_GOIY;

drop index if exists KHOIXETTUYEN.KHOIXETTUYEN_PK;

drop table if exists KHOIXETTUYEN;

drop index if exists KQHOCTAP.KQHOCTAP_PK;

drop table if exists KQHOCTAP;

drop index if exists NGANHXETTUYEN.NGANHXETTUYEN_PK;

drop table if exists NGANHXETTUYEN;

drop index if exists NGANH_KHOIXETTUYEN.NGANH_KHOIXETTUYEN_PK;

drop table if exists NGANH_KHOIXETTUYEN;

drop index if exists TRUONGDAIHOC.TRUONGDAIHOC_PK;

drop table if exists TRUONGDAIHOC;

drop index if exists TRUONGDH_NGANHXT.TRUONGDH_NGANHXT_PK;

drop table if exists TRUONGDH_NGANHXT;

/*==============================================================*/
/* Table: GOIY                                                  */
/*==============================================================*/
create table GOIY 
(
   MAGOIY               varchar(10)                    not null,
   LYDOGOIY             long varchar                   null,
   constraint PK_GOIY primary key clustered (MAGOIY)
);

/*==============================================================*/
/* Index: GOIY_PK                                               */
/*==============================================================*/
create unique clustered index GOIY_PK on GOIY (
MAGOIY ASC
);

/*==============================================================*/
/* Table: HOCSINH                                               */
/*==============================================================*/
create table HOCSINH 
(
   MAHS                 varchar(10)                    not null,
   MAKQ                 varchar(10)                    not null,
   HOTEN                varchar(30)                    null,
   NGAYSINH             date                           null,
   DIACHI               varchar(30)                    null,
   SDT                  numeric(10)                    null,
   constraint PK_HOCSINH primary key clustered (MAHS)
);

/*==============================================================*/
/* Index: HOCSINH_PK                                            */
/*==============================================================*/
create unique clustered index HOCSINH_PK on HOCSINH (
MAHS ASC
);

/*==============================================================*/
/* Index: HOCSINH_KETQUA_FK                                     */
/*==============================================================*/
create index HOCSINH_KETQUA_FK on HOCSINH (
MAKQ ASC
);

/*==============================================================*/
/* Table: HOCSINH_GOIY                                          */
/*==============================================================*/
create table HOCSINH_GOIY 
(
   MAHS                 varchar(10)                    not null,
   MAGOIY               varchar(10)                    not null,
   constraint PK_HOCSINH_GOIY primary key clustered (MAHS, MAGOIY)
);

/*==============================================================*/
/* Index: HOCSINH_GOIY_PK                                       */
/*==============================================================*/
create unique clustered index HOCSINH_GOIY_PK on HOCSINH_GOIY (
MAHS ASC,
MAGOIY ASC
);

/*==============================================================*/
/* Table: KHOIXETTUYEN                                          */
/*==============================================================*/
create table KHOIXETTUYEN 
(
   MAKHOI               varchar(10)                    not null,
   TENKHOI              varchar(20)                    null,
   constraint PK_KHOIXETTUYEN primary key clustered (MAKHOI)
);

/*==============================================================*/
/* Index: KHOIXETTUYEN_PK                                       */
/*==============================================================*/
create unique clustered index KHOIXETTUYEN_PK on KHOIXETTUYEN (
MAKHOI ASC
);

/*==============================================================*/
/* Table: KQHOCTAP                                              */
/*==============================================================*/
create table KQHOCTAP 
(
   MAKQ                 varchar(10)                    not null,
   DIEMTOAN             float                          null,
   DIEMANH              float                          null,
   DIEMVAN              float                          null,
   MONTUCHON            float                          null,
   NAMHOC               varchar(10)                    null,
   constraint PK_KQHOCTAP primary key clustered (MAKQ)
);

/*==============================================================*/
/* Index: KQHOCTAP_PK                                           */
/*==============================================================*/
create unique clustered index KQHOCTAP_PK on KQHOCTAP (
MAKQ ASC
);

/*==============================================================*/
/* Table: NGANHXETTUYEN                                         */
/*==============================================================*/
create table NGANHXETTUYEN 
(
   MANGHANH             varchar(10)                    not null,
   TENNGANH             varchar(20)                    null,
   MOTA                 long varchar                   null,
   constraint PK_NGANHXETTUYEN primary key clustered (MANGHANH)
);

/*==============================================================*/
/* Index: NGANHXETTUYEN_PK                                      */
/*==============================================================*/
create unique clustered index NGANHXETTUYEN_PK on NGANHXETTUYEN (
MANGHANH ASC
);

/*==============================================================*/
/* Table: NGANH_KHOIXETTUYEN                                    */
/*==============================================================*/
create table NGANH_KHOIXETTUYEN 
(
   MANGHANH             varchar(10)                    not null,
   MAKHOI               varchar(10)                    not null,
   constraint PK_NGANH_KHOIXETTUYEN primary key clustered (MANGHANH, MAKHOI)
);

/*==============================================================*/
/* Index: NGANH_KHOIXETTUYEN_PK                                 */
/*==============================================================*/
create unique clustered index NGANH_KHOIXETTUYEN_PK on NGANH_KHOIXETTUYEN (
MANGHANH ASC,
MAKHOI ASC
);

/*==============================================================*/
/* Table: TRUONGDAIHOC                                          */
/*==============================================================*/
create table TRUONGDAIHOC 
(
   MATRUONGDH           varchar(10)                    not null,
   TENTRUONGDH          varchar(30)                    null,
   DIACHITRUONG         varchar(50)                    null,
   WEBSITE              varchar(20)                    null,
   SDTTRUONG            numeric(10)                    null,
   EMAIL                varchar(20)                    null,
   constraint PK_TRUONGDAIHOC primary key clustered (MATRUONGDH)
);

/*==============================================================*/
/* Index: TRUONGDAIHOC_PK                                       */
/*==============================================================*/
create unique clustered index TRUONGDAIHOC_PK on TRUONGDAIHOC (
MATRUONGDH ASC
);

/*==============================================================*/
/* Table: TRUONGDH_NGANHXT                                      */
/*==============================================================*/
create table TRUONGDH_NGANHXT 
(
   MATRUONGDH           varchar(10)                    not null,
   MANGHANH             varchar(10)                    not null,
   MAGOIY               varchar(10)                    not null,
   NAMTUYENSINH         date                           null,
   CHITIEUTS            numeric                        null,
   DIEMCHUAN            float                          null,
   constraint PK_TRUONGDH_NGANHXT primary key clustered (MATRUONGDH, MANGHANH, MAGOIY)
);

/*==============================================================*/
/* Index: TRUONGDH_NGANHXT_PK                                   */
/*==============================================================*/
create unique clustered index TRUONGDH_NGANHXT_PK on TRUONGDH_NGANHXT (
MATRUONGDH ASC,
MANGHANH ASC,
MAGOIY ASC
);

alter table HOCSINH
   add constraint FK_HOCSINH_HOCSINH_K_KQHOCTAP foreign key (MAKQ)
      references KQHOCTAP (MAKQ)
      on update restrict
      on delete restrict;

alter table HOCSINH_GOIY
   add constraint FK_HOCSINH__HOCSINH_G_HOCSINH foreign key (MAHS)
      references HOCSINH (MAHS)
      on update restrict
      on delete restrict;

alter table HOCSINH_GOIY
   add constraint FK_HOCSINH__HOCSINH_G_GOIY foreign key (MAGOIY)
      references GOIY (MAGOIY)
      on update restrict
      on delete restrict;

alter table NGANH_KHOIXETTUYEN
   add constraint FK_NGANH_KH_NGANH_KHO_NGANHXET foreign key (MANGHANH)
      references NGANHXETTUYEN (MANGHANH)
      on update restrict
      on delete restrict;

alter table NGANH_KHOIXETTUYEN
   add constraint FK_NGANH_KH_NGANH_KHO_KHOIXETT foreign key (MAKHOI)
      references KHOIXETTUYEN (MAKHOI)
      on update restrict
      on delete restrict;

alter table TRUONGDH_NGANHXT
   add constraint FK_TRUONGDH_TRUONGDH__TRUONGDA foreign key (MATRUONGDH)
      references TRUONGDAIHOC (MATRUONGDH)
      on update restrict
      on delete restrict;

alter table TRUONGDH_NGANHXT
   add constraint FK_TRUONGDH_TRUONGDH__NGANHXET foreign key (MANGHANH)
      references NGANHXETTUYEN (MANGHANH)
      on update restrict
      on delete restrict;

alter table TRUONGDH_NGANHXT
   add constraint FK_TRUONGDH_TRUONGDH__GOIY foreign key (MAGOIY)
      references GOIY (MAGOIY)
      on update restrict
      on delete restrict;

