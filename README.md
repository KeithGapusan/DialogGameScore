# GameScoreDialog
A reusable dialog for a 2 player project.

![Packagist](https://img.shields.io/packagist/l/doctrine/orm.svg)
![Swift 4.0.x](https://img.shields.io/badge/Swift-4.0.x-orange.svg)
![Version](https://img.shields.io/badge/Version-1.0-green.svg)

### CocoaPods
https://cocoapods.org/pods/DialogGameScore
```swift
target 'MyApp' do
    pod 'DialogGameScore', '~> 0.0.2'
end
```

### Objective-C


```objective-c
#import "DialogGameScore-Swift.h"

@interface ViewController () <GameDialogViewDelegate>

@end
@implementation ViewController

GameScoreDialog *gameView;

- (void)viewDidLoad {
    gameView = [[GameScoreDialog alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.origin.y - 100, self.view.frame.size.width, self.view.frame.size.height)];
    gameView.delegate = self;
    [self.view addSubview:gameView];
    /*if you want to set the label title*/
    gameView.tfHome.text = [NSString stringWithFormat:@"%@",self.gameDetailDictionary[@"total_score"]];;
}

/*delegate method*/
- (void)didPressedButton:(NSDictionary<NSString *,id> * _Nonnull)data {



    NSString *button = [data objectForKey:@"button"];
    if ([button isEqualToString:@"submit"]){
        NSLog(@" %@" ,[data objectForKey:@"button"] );
        /**
            add your post method here
        **/
        NSDictionary *score = [data objectForKey:@"data"];
        NSLog(@" %@ %@" , [score objectForKey:@"homeScore"],[score objectForKey:@"oppponentScore"]  );
        [self.gameDetailDictionary addEntriesFromDictionary:score];
        //[self.gameDetailDictionary setObject:score forKey:@"score"];
        NSLog(@"%@" , self.gameDetailDictionary);
        }else{
            [gameView removeFromSuperview];
        }
}


```


