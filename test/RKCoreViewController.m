//
//  RKCoreViewController.m
//  test
//
//  Created by Mickey Barboi on 9/15/13.
//  Copyright (c) 2013 HardinDD. All rights reserved.
//

#import "RKCoreViewController.h"
#import "Flavor.h"

@interface RKCoreViewController ()

@end

@implementation RKCoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated {
    //
    [self setupRKStoreWithBasePath:@"http://www.culvers.com/cws2/"];
    [self setupRestKit:[RKObjectManager sharedManager]];
    
    /*Flavor *new = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Flavor class]) inManagedObjectContext:[RKManagedObjectStore defaultStore].mainQueueManagedObjectContext];
    
    [new setName:@"AAAAAATEST"];
    [new setFlavorID:@"25"];
    
    NSError *err;
    [[RKManagedObjectStore defaultStore].mainQueueManagedObjectContext save:&err];
    
    if(err != nil) {
        NSLog(@"%@", err);
    }*/
    
    [[RKObjectManager sharedManager]  getObjectsAtPath:@"queryflavors.aspx" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        NSLog(@"hello?");
    }
     failure:^(RKObjectRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@",error);
        
    }];
}

- (void) setupRestKit:(RKObjectManager *)manager {
    
    [manager addResponseDescriptor:[Flavor entityMapping]];
    return;
    
    /*RKObjectManager *manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://www.culvers.com/cws2/queryflavors.aspx"]];

    
    NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    manager.managedObjectStore = managedObjectStore;*/
    

    //object mapping
    RKEntityMapping *aeroplaneMapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass([Flavor class]) inManagedObjectStore:[RKManagedObjectStore defaultStore]];
    
    aeroplaneMapping.identificationAttributes = @[ @"flavorID" ];
    
    [aeroplaneMapping addAttributeMappingsFromDictionary:@{@"flavorId": @"flavorID",
                                                           @"flavorName": @"name", }];
    
    //[aeroplaneMapping addAttributeMappingsFromDictionary:parentObjectMapping];
    
    //[aeroplaneMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"category" toKeyPath:@"category" withMapping:categoryMapping]];
    
    [manager addResponseDescriptorsFromArray:@[ [RKResponseDescriptor responseDescriptorWithMapping:aeroplaneMapping
                                                                                       pathPattern:@"queryflavors.aspx"
                                                                                           keyPath:@""                                         statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)]
                                               ]];
}

- (void) controllerDidChangeContent:(NSFetchedResultsController *)controller{

    NSLog(@"Something has changed!");
}

- (IBAction) test:(id)sender {
    NSManagedObjectContext *moc = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Flavor" inManagedObjectContext:moc];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    // Set example predicate and sort orderings...
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"name" ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    
    NSError *error;
    NSArray *array = [moc executeFetchRequest:request error:&error];
    if (array == nil)
    {
        // Deal with error...
    }
}


#pragma mark New ModelManager
- (void *) setupRKStoreWithBasePath:(NSString *)path {
    //inits the persistant store
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:path]];
    
    NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    manager.managedObjectStore = managedObjectStore;
    
    [managedObjectStore createPersistentStoreCoordinator];
    
    NSString *storePath = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"db.sqlite"];
    NSError *error;
    
    NSPersistentStore *persistentStore = [managedObjectStore addSQLitePersistentStoreAtPath:storePath fromSeedDatabaseAtPath:nil withConfiguration:nil options:@{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES} error:&error];
    
    NSAssert(persistentStore, @"Failed to add persistent store with error: %@", error);
    
    [managedObjectStore createManagedObjectContexts];
    
    // Configure a managed object cache to ensure we do not create duplicate objects
    managedObjectStore.managedObjectCache = [[RKInMemoryManagedObjectCache alloc] initWithManagedObjectContext:managedObjectStore.persistentStoreManagedObjectContext];

}
@end
