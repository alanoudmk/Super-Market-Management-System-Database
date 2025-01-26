REM   Script: databaseProjectSupermarket
REM   DATA

CREATE TABLE Store(     
    	commercial_ID VARCHAR2(20) NOT NULL,     
   	 	store_Name VARCHAR2(30),     
    	store_Location VARCHAR2(30),     
    	CONSTRAINT store_PK PRIMARY KEY(commercial_ID),   
   	 	CONSTRAINT store_check CHECK( store_Location IN ('Jeddah','Mekkah') )		);

CREATE TABLE Employee(     
   	 	employee_ID NUMBER(10) NOT NULL,     
   	 	commercial_ID VARCHAR2(20) NOT NULL,     
    	employee_Name VARCHAR2(30) NOT NULL,     
    	employee_Address VARCHAR2(20),     
    	CONSTRAINT employee_PK PRIMARY KEY(employee_ID),     
   	 	CONSTRAINT employee_FK FOREIGN KEY(commercial_ID) REFERENCES Store(commercial_ID)  	);

CREATE TABLE Supplier(     
   	 	supplier_ID VARCHAR2(20) NOT NULL,     
    	supplier_Name VARCHAR2(30) NOT NULL,     
  	  	supplier_Phone NUMBER(10),     
   	 	supplier_Address VARCHAR2(50),     
    	CONSTRAINT supplier_PK PRIMARY KEY(supplier_ID)  		);

CREATE TABLE Product(     
 	   product_Code VARCHAR2(20) NOT NULL,     
   	   commercial_ID VARCHAR2(20) NOT NULL,     
  	   supplier_ID VARCHAR2(20) NOT NULL,     
  	   product_Name VARCHAR2(30) NOT NULL,    
   	   product_Price DECIMAL(10,2) NOT NULL,     
       product_Quantity NUMBER NOT NULL,     
       CONSTRAINT product_PK PRIMARY KEY(product_Code),     
       CONSTRAINT product_supplier_FK FOREIGN KEY(supplier_ID) REFERENCES Supplier(supplier_ID),     
  	   CONSTRAINT product_store_FK FOREIGN KEY(commercial_ID) REFERENCES Store(commercial_ID)  	);

CREATE TABLE Customer(     
    	customer_ID NUMBER(12) NOT NULL,     
   	 	customer_Name VARCHAR2(50),     
    	customer_Phone Number(10),     
   	 	CONSTRAINT customer_PK PRIMARY KEY(customer_ID)  	 );

CREATE TABLE Orders(     
    	order_Number VARCHAR2(20)NOT NULL,     
   	 	customer_ID NUMBER(12) NOT NULL,     
  	  	order_Date DATE DEFAULT SYSDATE,     
   	 	CONSTRAINT orders_PK PRIMARY KEY(order_Number),     
   		CONSTRAINT orders_FK FOREIGN KEY(customer_ID) REFERENCES Customer(customer_ID)   );

CREATE TABLE Item(     
  	  	item_ID VARCHAR2(20) NOT NULL,     
   	 	product_Code VARCHAR2(20) NOT NULL,     
    	order_Number VARCHAR2(20) NOT NULL,     
   	 	item_Quantity NUMBER,     
    	CONSTRAINT item_PK PRIMARY KEY(item_ID),     
   	 	CONSTRAINT item_product_FK FOREIGN KEY(product_Code) REFERENCES Product(product_Code),     
    	CONSTRAINT item_orders_FK FOREIGN KEY(order_Number) REFERENCES Orders(order_Number)   );

INSERT INTO Store (commercial_ID, store_Name, store_Location) VALUES ('1190', 'Super Market Alamal', 'Jeddah');

INSERT INTO Store (commercial_ID, store_Name, store_Location) VALUES ('4221', 'Super Market Obhur', 'Mekkah');

INSERT INTO Employee (employee_ID, commercial_ID, employee_Name, employee_Address)   VALUES (1, '1190', 'Omar Ali', 'Jeddah');

INSERT INTO Employee (employee_ID, commercial_ID, employee_Name, employee_Address)   VALUES (2, '1190', 'Ahmed saleh','Jeddah');

INSERT INTO Employee (employee_ID, commercial_ID, employee_Name, employee_Address)    VALUES (3, '1190', 'Abeer Salem', 'Jeddah');

INSERT INTO Employee (employee_ID, commercial_ID, employee_Name, employee_Address)   VALUES (4, '1190', 'Manar Adel', 'Jeddah');

INSERT INTO Employee (employee_ID, commercial_ID, employee_Name, employee_Address)   VALUES (5, '1190', 'khalid Hassan', 'Jeddah');

INSERT INTO Employee (employee_ID, commercial_ID, employee_Name, employee_Address)   VALUES (6, '4221', 'Bayan Salem', 'Mekkah');

INSERT INTO Employee (employee_ID, commercial_ID, employee_Name, employee_Address)   VALUES (7, '4221', 'Walaa Naif', 'Mekkah');

INSERT INTO Employee (employee_ID, commercial_ID, employee_Name, employee_Address)   VALUES (8, '4221', 'Lubna Bassem', 'Mekkah');

INSERT INTO Employee (employee_ID, commercial_ID, employee_Name, employee_Address)   VALUES (9, '4221', 'Manal Aziz', 'Mekkah');

INSERT INTO Employee (employee_ID, commercial_ID, employee_Name, employee_Address)   VALUES (10, '4221', 'Remaz Loai', 'Mekkah');

INSERT INTO Supplier (supplier_ID, supplier_Name, supplier_Phone, supplier_Address)   VALUES ('S1', 'AL-Ameen Compnay', 0512345678, 'Dammam');

INSERT INTO Supplier (supplier_ID, supplier_Name, supplier_Phone, supplier_Address)   VALUES ('S2', 'Nadec Company', 0509876543, 'Riyadh');

INSERT INTO Supplier (supplier_ID, supplier_Name, supplier_Phone, supplier_Address)   VALUES ('S3', 'Americana Foods Company', 0559871234, 'Jeddah');

INSERT INTO Supplier (supplier_ID, supplier_Name, supplier_Phone, supplier_Address)   VALUES ('S4', 'Al-Marai Company', 0505196284, 'Makkah');

INSERT INTO Supplier (supplier_ID, supplier_Name, supplier_Phone, supplier_Address)   VALUES ('S5', 'Al-Thimar Farm', 0551873472, 'Riyadh');

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P1', '1190', 'S1','Spaghetti pasta', 29.75, 100);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P2', '1190', 'S1','White bread', 5.00, 50);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P3', '1190', 'S1','Rice', 40.00, 250);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P4', '1190', 'S2','Fruit yoghurt', 10.50, 200);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P5', '1190', 'S2','Butter', 14.00 , 170);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P6', '1190', 'S3','Chicken strips', 32.99, 300);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P7', '1190', 'S3','Beef burger', 27.75, 150);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P8', '1190', 'S4','Fresh milk', 18.00, 80);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P9', '1190', 'S4','Mango juice', 6.75, 230);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P10', '1190', 'S4','Chedder cheese', 11.99, 320);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P11', '1190', 'S5','Tomatoes' ,7.99 , 130);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P12', '1190', 'S5','Cucumber',6.00, 120);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P13', '4221', 'S1','Spaghetti pasta', 29.75, 100);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P14', '4221', 'S1','White bread', 5.00, 50);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P15', '4221', 'S1','Rice', 40.00, 250);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P16', '4221', 'S2','Fruit yoghurt', 10.50, 200);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P17', '4221', 'S2','Butter', 14.00 , 170);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P18', '4221', 'S3','Chicken strips', 32.99, 300);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P19', '4221', 'S3','Beef burger', 27.75, 150);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P20', '4221', 'S4','Fresh milk', 18.00, 80);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P21', '4221', 'S4','Mango juice', 6.75, 230);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P22', '4221', 'S4','Chedder cheese', 11.99, 320);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P23', '4221', 'S5','Tomatoes' ,7.99 , 130);

INSERT INTO Product (product_Code, commercial_ID, supplier_ID, product_Name, product_Price, product_Quantity)   VALUES ('P24', '4221', 'S5','Cucumber',6.00, 120);

INSERT INTO Customer (customer_ID, customer_Name, customer_Phone)   VALUES (1121, 'Sara Saad', 0559736258);

INSERT INTO Customer (customer_ID, customer_Name, customer_Phone)   VALUES (1122, 'Jana Salman', 0552992187);

INSERT INTO Customer (customer_ID, customer_Name, customer_Phone)   VALUES (1123, 'Adam Naif', 0551936558);

INSERT INTO Customer (customer_ID, customer_Name, customer_Phone)   VALUES (1124, 'Mona Rami', 0590817336);

INSERT INTO Customer (customer_ID, customer_Name, customer_Phone)   VALUES (1125, 'Yousef Ziad', 0529736446);

INSERT INTO Customer (customer_ID, customer_Name, customer_Phone)   VALUES (1126, 'Rakan Faisal', 0555644103);

INSERT INTO Customer (customer_ID, customer_Name, customer_Phone)   VALUES (1127, 'Mohamed Hameed', 0529554103);

INSERT INTO Customer (customer_ID, customer_Name, customer_Phone)   VALUES (1128, 'Nayla Salman', 0529646783);

INSERT INTO Customer (customer_ID, customer_Name, customer_Phone)   VALUES (1129, 'Mazen Baker', 0529644123);

INSERT INTO Customer (customer_ID, customer_Name, customer_Phone)   VALUES (1131, 'Bushraa Faisal', 0559912377);

INSERT INTO Orders (order_Number, customer_ID, order_Date)   VALUES ('O1', 1121, TO_DATE('2024-05-01', 'YYYY-MM-DD'));

INSERT INTO Orders (order_Number, customer_ID, order_Date)   VALUES ('O2', 1122, TO_DATE('2024-05-01', 'YYYY-MM-DD'));

INSERT INTO Orders (order_Number, customer_ID, order_Date)   VALUES ('O3', 1123, TO_DATE('2024-05-01', 'YYYY-MM-DD'));

INSERT INTO Orders (order_Number, customer_ID, order_Date)   VALUES ('O4', 1124, TO_DATE('2024-05-02', 'YYYY-MM-DD'));

INSERT INTO Orders (order_Number, customer_ID, order_Date)   VALUES ('O5', 1121, TO_DATE('2024-05-02', 'YYYY-MM-DD'));

INSERT INTO Orders (order_Number, customer_ID, order_Date)   VALUES ('O6', 1125, TO_DATE('2024-05-03', 'YYYY-MM-DD'));

INSERT INTO Orders (order_Number, customer_ID, order_Date)   VALUES ('O7', 1126, TO_DATE('2024-05-04', 'YYYY-MM-DD'));

INSERT INTO Orders (order_Number, customer_ID, order_Date)   VALUES ('O8', 1121, TO_DATE('2024-05-04', 'YYYY-MM-DD'));

INSERT INTO Orders (order_Number, customer_ID, order_Date)   VALUES ('O9', 1125, TO_DATE('2024-05-05', 'YYYY-MM-DD'));

INSERT INTO Orders (order_Number, customer_ID, order_Date)   VALUES ('O10', 1123, TO_DATE('2024-05-06', 'YYYY-MM-DD'));

INSERT INTO Orders (order_Number, customer_ID, order_Date)   VALUES ('O11', 1127, TO_DATE('2024-05-06', 'YYYY-MM-DD'));

INSERT INTO Orders (order_Number, customer_ID, order_Date)   VALUES ('O12', 1129, TO_DATE('2024-05-06', 'YYYY-MM-DD'));

INSERT INTO Orders (order_Number, customer_ID, order_Date)   VALUES ('O13', 1128, TO_DATE('2024-05-07', 'YYYY-MM-DD'));

INSERT INTO Orders (order_Number, customer_ID, order_Date)   VALUES ('O14', 1131, TO_DATE('2024-05-07', 'YYYY-MM-DD'));

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I1', 'P9', 'O1', 2);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I2', 'P6', 'O1', 1);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I3', 'P8', 'O2', 3);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I4', 'P5', 'O3', 1);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I5', 'P2', 'O3', 4);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I6', 'P7', 'O4', 2);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I7', 'P3', 'O4', 1);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I8', 'P12', 'O5', 6);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I9', 'P11', 'O6', 5);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I10', 'P6', 'O6', 2);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I11', 'P4', 'O7', 4);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I12', 'P8', 'O7', 2);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I13', 'P3', 'O8', 1);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I14', 'P10', 'O9', 3);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I15', 'P1', 'O10', 2);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I16', 'P11', 'O10', 2);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I17', 'P13', 'O12', 2);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I18', 'P14', 'O14', 1);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I19', 'P17', 'O11', 3);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I20', 'P15', 'O12', 1);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I21', 'P16', 'O13', 4);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I22', 'P18', 'O14', 3);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I23', 'P19', 'O12', 7);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I24', 'P21', 'O11', 5);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I25', 'P20', 'O13', 2);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I26', 'P22', 'O14', 3);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I27', 'P24', 'O12', 2);

INSERT INTO Item (item_ID, product_Code, order_Number, item_Quantity)  VALUES ('I28', 'P23', 'O11', 1);

SELECT employee_Name FROM Employee   WHERE employee_Name LIKE'A%';

SELECT product_Code AS Code ,product_Name AS "Produt Name", product_Price AS Price  FROM Product  WHERE   product_Name='Cucumber' OR( product_Name='Tomatoes' AND product_Name='Spaghetti pasta' );

SELECT supplier_ID AS ID,supplier_Name AS "Supplier Name",supplier_Address   
    AS Address  FROM   Supplier   WHERE NOT supplier_Address='Jeddah' ;

	SELECT product_Code AS "Product ID",product_Price AS Price FROM Product     
        ORDER BY product_Code  ASC,product_Price  DESC;

	SELECT item_ID AS ID,item_Quantity AS Quantity FROM Item  ORDER BY item_Quantity  ;

	SELECT product_Name,COUNT(product_Name) FROM Product GROUP BY product_Name;

	SELECT commercial_ID,COUNT(*) FROM Employee GROUP BY commercial_ID ;

	SELECT product_Name,AVG(product_Price) FROM Product WHERE product_Name IN('Beef burger','Chicken strip')   
        GROUP BY product_Name HAVING AVG(product_Price)>11 ;

	SELECT    MIN( product_Price )   AS   "Smallest Price"   FROM   Product ;

	SELECT    MAX( item_Quantity )   AS   "MAX Item Quantity"   FROM   Item ;

	SELECT    SUM( product_Quantity ) AS "Total Ptoducts" FROM   Product ;

     SELECT Item.order_Number,Item.Item_ID,Product.product_Name  FROM Item  
     JOIN Product ON Item.Product_Code=Product.Product_Code WHERE Item.order_Number='O12';

      SELECT customer_ID,COUNT(order_Number)AS total_Orders FROM Orders Group By Customer_ID Order by Total_orders DESC;

      SELECT Customer.customer_Name ,Orders.order_Date FROM Customer JOIN Orders ON Customer.customer_ID= Orders.customer_ID ORDER BY Orders.order_Date DESC;

     SELECT Store.store_Name,Product.Product_Code,Product.Product_Name, Product.Product_Price AS"Largest Price" 
         FROM Product JOIN Store On Product.commercial_ID=Store.commercial_ID WHERE Product.Product_Price =(SELECT MAX(Product_Price)FROM Product);

CREATE OR REPLACE PROCEDURE GetOrderDetails (  p_order_Number IN VARCHAR2)  
AS  
BEGIN  
    FOR order_rec IN ( SELECT o.order_Number, c.customer_Name, p.product_Name, i.item_Quantity  
        FROM Orders o  
        JOIN Customer c ON o.customer_ID = c.customer_ID  
        JOIN Item i ON o.order_Number = i.order_Number  
        JOIN Product p ON i.product_Code = p.product_Code  
        WHERE o.order_Number = p_order_Number  
    )  
    LOOP  
        DBMS_OUTPUT.PUT_LINE('Order Number: ' || order_rec.order_Number ||   
                             ', Customer Name: ' || order_rec.customer_Name ||   
                             ', Product Name: ' || order_rec.product_Name ||   
                             ', Quantity: ' || order_rec.item_Quantity);  
    END LOOP;  
  
END GetOrderDetails ;  
  
--call procedure  
exec  GetOrderDetails('O1');  
  
-- another select procedure  
CREATE OR REPLACE PROCEDURE GetEmployeesByStore ( p_store_ID IN number)  
AS  
BEGIN  
    FOR emp_rec IN (  
        SELECT e.employee_ID, e.employee_Name, e.employee_Address  
        FROM Employee e  
        WHERE e.commercial_ID = p_store_ID  
    )  
    LOOP  
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_rec.employee_ID ||   
                             ', Employee Name: ' || emp_rec.employee_Name ||   
                             ', Employee Address: ' || emp_rec.employee_Address);  
    END LOOP;  
END GetEmployeesByStore;  
  
--call procedure  
exec GetEmployeesByStore('4221');  
  
  
  
/****Update****/  
--update query procedure  
CREATE OR REPLACE PROCEDURE UpdateProductQuantity( p_product_Code IN VARCHAR2, p_new_quantity IN NUMBER)   
    AS  
BEGIN  
    UPDATE Product  SET product_Quantity = p_new_quantity  
    WHERE product_Code = p_product_Code;  
      
    COMMIT;  
    DBMS_OUTPUT.PUT_LINE(' ~the Product quantity updated successfully ~');  
  
END UpdateProductQuantity;  
  
--call procedure  
exec UpdateProductQuantity('P1', 55);  
exec UpdateProductQuantity('P3', 190);  
  
--check  
select * from product ; 
/

