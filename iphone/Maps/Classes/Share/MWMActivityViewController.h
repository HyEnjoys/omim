@protocol MWMPlacePageObject;
@class PlacePageData;

@interface MWMActivityViewController : UIActivityViewController

+ (instancetype)shareControllerForEditorViral;

+ (instancetype)shareControllerForMyPosition:(CLLocationCoordinate2D)location;

+ (instancetype)shareControllerForPlacePageObject:(id<MWMPlacePageObject>)object;

+ (instancetype)shareControllerForPlacePage:(PlacePageData *)data;

+ (instancetype)shareControllerForURL:(NSURL * _Nullable)url
                              message:(NSString *)message
                    completionHandler:
                        (_Nullable UIActivityViewControllerCompletionWithItemsHandler)completionHandler;

- (void)presentInParentViewController:(UIViewController *)parentVC anchorView:(UIView *)anchorView;

@end
