//Cuentas
List<Map<String, dynamic>> accountsList = [
  {
    "id_account": 1001,
    "email": "admin1@gmail.com",
    "password": "password1",
    "rol": 1,
    "image": "assets/icons/logo.png"
  },
  {
    "id_account": 1002,
    "email": "usuario1@gmail.com",
    "password": "password1",
    "rol": 3,
    "image": "assets/icons/logo.png"
  },
  {
    "id_account": 1003,
    "email": "empresa1@gmail.com",
    "password": "password1",
    "rol": 2,
    "image": "assets/icons/logo.png"
  },
];

//Administradores
List<Map<String, dynamic>> adminsList = [
  {
    "id_admin": 67858743658,
    "name_admin": "Julian Alvarez",
    "id_account": 1001,
  },
];

//Empresas
List<Map<String, dynamic>> bussinessList = [
  {
    "id_bussiness": 234324,
    "name_bussiness": "Ferretería Gomez",
    "sold_products": 1034,
    "total_products": 2500,
    "id_admin": 67858743658,
  },
  {
    "id_bussiness": 993023,
    "name_bussiness": "Telas Colombia",
    "sold_products": 452,
    "total_products": 1820,
    "id_admin": 67858743658,
  },
  {
    "id_bussiness": 1340023,
    "name_bussiness": "Cosméticos maría",
    "sold_products": 876,
    "total_products": 2030,
    "id_admin": 67858743658,
  },
];
