import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { BookingController } from './booking.controller';
import { BookingService } from './booking.service';
import { Booking, BookingSchema } from './schemas/booking.schema';
import { MetricsModule } from './metrics/metrics.module';
import { HealthModule } from 'libs/common/health/health.module';

@Module({
  imports: [
    MongooseModule.forFeature([{ name: Booking.name, schema: BookingSchema }]),
    MetricsModule,
    HealthModule,
  ],
  controllers: [BookingController],
  providers: [BookingService],
})
export class BookingModule {}
