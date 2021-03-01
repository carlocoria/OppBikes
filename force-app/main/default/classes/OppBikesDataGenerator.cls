public class OppBikesDataGenerator {
    
    public static void start(){
        createOppProductsRecords();
        createInventoryRecords();
    }
    
    public static void createInventoryRecords(){
        List<Product__c> productList = new List<Product__c>();
        List<Inventory__c> invList = new List<Inventory__c>();

        productList = [SELECT id, Name, Frame_Material__c, Frame_Type__c, Color__c FROM Product__c];

        for(Product__c p: productList) {
            invList.add(inventoryTemplate(p, 'Green', 'S', 200, true));
            invList.add(inventoryTemplate(p, 'Black', 'M', 300, false));
            invList.add(inventoryTemplate(p, 'Blue', 'M', 300, false));
            invList.add(inventoryTemplate(p, 'Red', 'L', 350, false));
            invList.add(inventoryTemplate(p, 'Pink', 'XL', 400, false));
        }

        insert invList;
    }

    
    public static void createOppProductsRecords() {
        List<Product__c> productList = new List<Product__c>();
        String colors = 'Blue;Black;Green;Red;Pink';

        productList.add(productTemplate('Breeze', 'Aluminum', 'Cruisers', colors, 300));
        productList.add(productTemplate('Eagle', 'Carbon Fiber', 'Road', colors, 300));
        productList.add(productTemplate('Night Rider', 'Titanium', 'BMX', colors, 300));
        productList.add(productTemplate('Jet', 'Carbon Fiber', 'Performance', colors, 300));
        productList.add(productTemplate('Jet2', 'Carbon Fiber', 'Performance', colors, 350));
        productList.add(productTemplate('Jet3', 'Carbon Fiber', 'Performance', colors, 350));
        productList.add(productTemplate('Bluff', 'Aluminum', 'BMX', colors, 400));
        productList.add(productTemplate('Skylight', 'Aluminum', 'Hybrid', colors, 450));
        productList.add(productTemplate('Glacier', 'Aluminum', 'Hybrid', colors, 450));
        productList.add(productTemplate('Triton', 'Titanium', 'Road', colors, 500));
        productList.add(productTemplate('Triton2', 'Titanium', 'Road', colors, 500));
        productList.add(productTemplate('Radio', 'Aluminum', 'Cruisers', colors, 300));
        productList.add(productTemplate('Shadow', 'Aluminum', 'BMX', colors, 300));
        productList.add(productTemplate('Red Rock', 'Aluminum', 'Mountain', colors, 300));
        productList.add(productTemplate('Sky', 'Aluminum', 'Road', colors, 400));
        productList.add(productTemplate('Sky Max', 'Carbon Fiber', 'Hybrid', colors, 400));
        productList.add(productTemplate('Rocket', 'Carbon Fiber', 'Performance', colors, 600));
        productList.add(productTemplate('Rocket2', 'Carbon Fiber', 'Performance', colors, 650));
        productList.add(productTemplate('Stallion', 'Aluminum', 'Mountain', colors, 500));
        productList.add(productTemplate('Megatron', 'Titanium', 'Mountain', colors, 500));

        insert productList;
    }

    private static Product__c productTemplate(String name, String material, String type, String color, Integer price){
        Product__c p = new Product__c();
        p.Name = name;
        p.Frame_Material__c = material;
        p.Frame_Type__c = type;
        p.Color__c = color;
        p.Price__c = price;

        return p;
    }

    private static Inventory__c inventoryTemplate(Product__c p, String color, String size, Integer qty, boolean disc){
        Inventory__c inv = new Inventory__c();
            inv.Product_Name__c = p.Id;
            inv.Frame_Material__c = p.Frame_Material__c;
            inv.Frame_Type__c = p.Frame_Type__c;
            inv.Color__c = color;
            inv.Size__c = size;
            inv.Quantity_on_Hand__c = qty;
            inv.Discontinued__c = disc;

        return inv;
    }
}
