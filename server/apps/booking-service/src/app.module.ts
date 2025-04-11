import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { BookingModule } from './booking.module';
import { MetricsModule } from './metrics/metrics.module';
import { HealthModule } from 'libs/common/health/health.module';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { join } from 'path';


@Module({
  imports: [

    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: join(process.cwd(), 'apps/booking-service/.env'),
    }),


    MongooseModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: (configService: ConfigService) => {
        const uri = process.env.MONGO_URL || configService.get<string>('MONGO_URL');
        console.log('>>> MONGO_URL:', uri); 
        return { uri };
      },
      inject: [ConfigService],
    }),


    BookingModule,
    HealthModule,
    MetricsModule
  ],
})
export class AppModule { }
